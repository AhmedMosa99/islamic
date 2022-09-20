import 'package:flutter_icons_helper/flutter_icons_helper.dart';
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
  var helper = IconHelper();
  changeView(bool grid) {
    isGrid = grid;
    update();
  }

  getUserInfo(String token) async {
    user = await MainDio.getUssrInfo(token);
    update();
  }

  getUserInfoWithoutLogin() async {
    user = await MainDio.getService();
    update();
  }

  getNews(String token) async {
    newsModel = await MainDio.getNews(token);
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
    if (token == null) {
      getUserInfoWithoutLogin();
      getNewsWithoutToken();
    }
  }
}
