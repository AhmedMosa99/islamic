import 'package:flutter_icons_helper/flutter_icons_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:islamic_unveristy/moduls/auth/models/userInfo.dart';
import 'package:islamic_unveristy/moduls/home/models/news_model.dart';
import 'package:islamic_unveristy/moduls/home/models/notification_model.dart';
import 'package:islamic_unveristy/services/api/main.dart';
import 'package:islamic_unveristy/shared/constant.dart';

class HomeController extends GetxController {
  bool isGrid = true;
  NewsModel? newsModel;
  NotificationModel? notificationModel;
  User? user;
  List<Services> list = [];
  var helper = IconHelper();
  bool isLoading = false;
  changeView(bool grid) {
    isGrid = grid;
    update();
  }

  getUserInfo(String token) async {
    isLoading = true;
    user = await MainDio.getUssrInfo(token);
    user!.services?.forEach((element) {
      if (element.alwaysOnTop!) {
        list.add(element);
        update();
      }
    });
    isLoading = false;
    update();
  }

  getUserInfoWithoutLogin() async {
    isLoading = true;
    user = await MainDio.getService();
    isLoading = false;
    update();
  }

  getNews(String token) async {
    newsModel = await MainDio.getNews(token);
    update();
  }

  favourite(int id, bool flag) async {
    if (token != null) {
      list = [];
      var x = await MainDio.favouriteSer(id, flag);
      print(x);
    }
    await getUserInfo(token!);
    update();
  }

  getNewsWithoutToken() async {
    newsModel = await MainDio.getNewsWithoutToken();
    update();
  }

  getNotification() async {
    notificationModel = await MainDio.getNotification();
    update();
  }

  @override
  void onInit() {
    MainDio.init();
    if (token != null) {
      getUserInfo(token!);
      getNews(token!);
      getNotification();
      getNewsWithoutToken();
    }
    getUserInfoWithoutLogin();
    if (token == null) {
      getUserInfoWithoutLogin();
      getNewsWithoutToken();
    }
  }
}
