import 'package:flutter/material.dart';
import 'package:flutter_icons_helper/flutter_icons_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  bool isSearch = false;
  TextEditingController search = TextEditingController();
  List<Services> list = [];
  List<Services> listSearch = [];
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

  searchService(String query) async {
    isSearch = true;
    update();
    if (query == "") {
      getUserInfo(token!);
      listSearch = user!.services!;
      isSearch = false;
      update();
    } else {
      listSearch = user!.services!
          .where((e) => e.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();

      // user!.services?.forEach((element) {
      //   if (element.title!.contains(query)) {
      //     list.add(element);
      //     update();
      //     print('true');
      //   } else {
      //     list = [];
      //     print('false');
      //   }
      //   list.map((e) => print(e.title));
      //   user!.services = list;
      // });
      print(user!.services!.length);
      user!.services = listSearch;
      update();
      print(listSearch.length);
    }
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

  favourite(int id, bool flag, context) async {
    if (token != null) {
      Get.bottomSheet(Container(
        height: 200.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ));
      list = [];
      var x = await MainDio.favouriteSer(id, flag);
      Get.back();
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
