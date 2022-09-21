import 'package:dio/dio.dart';
import 'package:islamic_unveristy/moduls/auth/models/userInfo.dart';
import 'package:islamic_unveristy/moduls/home/models/news_model.dart';
import 'package:islamic_unveristy/shared/constant.dart';

import '../../moduls/home/models/notification_model.dart';
import 'dio.dart';

class MainDio {
  static Dio? dio;
  static String? baseUrl;
  static init() {
    dio = ApiDio.createDio();
    baseUrl = dio!.options.baseUrl;
  }

  static Future<User?> getUssrInfo(token) async {
    final path = '${baseUrl}Users/GetMyData?culture=$langApi';
    final Response request;
    User? user;
    try {
      request = await dio!.get(path,
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': "$token",
          }));
      print(request.data);
      if (request.statusCode! < 400) {
        user = User.fromJson(request.data);
      } else {}
    } on Exception {
      // TODO
    }
    return user;
  }

  static Future<User?> getService() async {
    print(baseUrl);
    final path =
        'https://staging.iu.edu.sa/mobileapis/Services/GetServices?culture=$langApi';
    final Response request;
    User? user;
    try {
      request = await dio!.get(path,
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': "kjhfjkashdfkljashflkasfhdkjhksfd",
          }));
      print(request.data);
      if (request.statusCode! < 400) {
        user = User.fromJson(request.data);
      } else {}
    } on Exception {
      // TODO
    }
    return user;
  }

  static Future<NewsModel?> getNews(String token) async {
    print(baseUrl);
    final path =
        '${baseUrl}News/GetNews?startIndex=0&pageSize=10&storingExpression=Id';
    final Response request;
    NewsModel? newsModel;
    try {
      request = await dio!.get(path,
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': token,
          }));
      print(request.data);
      if (request.statusCode! < 400) {
        newsModel = NewsModel.fromJson(request.data);
      } else {}
    } on Exception {
      // TODO
    }
    return newsModel;
  }

  static Future<NewsModel?> getNewsWithoutToken() async {
    final path =
        'https://staging.iu.edu.sa/mobileapis/Services/GetNews?startIndex=0&pageSize=10&storingExpression=Id';
    final Response request;
    NewsModel? newsModel;
    try {
      request = await dio!.get(path,
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': 'kjhfjkashdfkljashflkasfhdkjhksfd',
          }));
      print(request.data);
      if (request.statusCode! < 400) {
        newsModel = NewsModel.fromJson(request.data);
      } else {}
    } on Exception {
      // TODO
    }
    return newsModel;
  }

  static Future<int?> favouriteSer(int id, bool flag) async {
    final path =
        'http://staging.iu.edu.sa/mobileapis/Users/SetServiceAlwaysOnTop?iuServiceId=$id&alwaysOnTop=${flag.toString()}';
    final Response request;
    print(path);
    int? newsModel;
    try {
      print(token);
      request = await dio!
          .get(path, options: Options(headers: {'Authorization': token}));
      if (request.statusCode! < 400) {
        newsModel = request.statusCode;
      } else {}
    } on Exception {
      // TODO
    }
    return newsModel;
  }

  static Future<NotificationModel?> getNotification() async {
    print(baseUrl);
    final path =
        '${baseUrl}Events/GetEvents?startIndex=0&pageSize=10&storingExpression=Id?culture=$langApi';
    final Response request;
    NotificationModel? notificationModel;
    try {
      request = await dio!.get(path,
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': "$token",
          }));
      print(request.data);
      if (request.statusCode! < 400) {
        notificationModel = NotificationModel.fromJson(request.data);
      } else {}
    } on Exception {
      // TODO
    }
    return notificationModel;
  }
}
