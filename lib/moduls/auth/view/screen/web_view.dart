import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_unveristy/moduls/auth/controller/controller.dart';
import 'package:islamic_unveristy/moduls/home/controller/home_controller.dart';
import 'package:islamic_unveristy/moduls/main/views/screens/mainScreen.dart';
import 'package:islamic_unveristy/services/local_data/share_pref.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../shared/constant.dart';

class WebViewCheck extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late final WebViewController? controllerview;
  WebViewCheck({Key? key, this.controllerview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: GetBuilder<AuthController>(builder: (logic) {
        return SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              print('G');
              if (await controllerview!.canGoBack()) {
                controllerview!.goBack();
                return false;
              }
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(
                          "Do you really want to exit the app",
                          style: TextStyle(fontSize: 16.sp),
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                SystemNavigator.pop();
                              },
                              child: const Text('Yes')),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text('No')),
                        ],
                      ));
              return Future.value(false);
            },
            child: WebView(
              initialUrl: "https://staging.iu.edu.sa/mobileapis",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                print('WebView is loading (progress : $progress%)');
              },
              javascriptChannels: const <JavascriptChannel>{
                // _toasterJavascriptChannel(context),
              },
              navigationDelegate: (NavigationRequest request) async {
                print(request.url);
                print(request.url.split('/').last.split('?').first);

                if (request.url.split('/').last.split('?').first ==
                    "LoginSuccessfully") {
                  var map = Uri.splitQueryString(request.url);
                  print(map);
                  var search = request.url.split('?')[1];
                  var f = Uri.splitQueryString(search);
                  var x1 = f['j'];
                  print(jsonDecode(x1!));
                  var v = jsonDecode(x1);
                  token = v['Token'];
                  await SharePref.init();
                  await SharePref.setData(key: 'token', data: v['Token']);
                  token = await SharePref.getData(key: 'token');
                  HomeController controller = Get.put(HomeController());
                  await controller.getUserInfo(token!);
                  await controller.getNews(token!);
                  await controller.getNotification();

                  await Get.offAll(() => const MainScreen());
                }
                // var x = request.url;
                // var map = Uri.splitQueryString(x);
                // var search = x.split('?')[1];
                // print(search);
                // var f = Uri.splitQueryString(search);
                // var x1 = f['j'];
                // print(x1);

                return NavigationDecision.navigate;
              },
              onPageStarted: (String url) {
                // print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                // print('Page finished loading: $url');
              },
              gestureNavigationEnabled: false,
              backgroundColor: const Color(0x00000000),
            ),
          ),
        );
      })),
    );
  }
}
