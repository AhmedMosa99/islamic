import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:islamic_unveristy/moduls/auth/view/screen/web_view.dart';
import 'package:islamic_unveristy/moduls/home/controller/home_controller.dart';

import '../../../../utils/component/component.dart';
import '../../../../utils/themes/light_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.h,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Color(0xffffffff),
            statusBarBrightness: Brightness.dark),
      ),
      body: GetBuilder<HomeController>(builder: (logic) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 20.w,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 175.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          viewportFraction: 1,
                          aspectRatio: 2.0,
                          initialPage: 0,
                        ),
                        itemCount: logic.newsModel!.records!.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.network(
                                  logic.newsModel!.records![index].image!,
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: DotsIndicator(
                                  decorator: DotsDecorator(
                                      spacing: const EdgeInsets.only(right: 6),
                                      activeColor: Colors.black,
                                      size: const Size.square(6.0),
                                      activeSize: const Size(13.0, 6.0),
                                      activeShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0))),
                                  dotsCount: logic.newsModel!.records!.length,
                                  position: index.toDouble(),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      height: 32.h,
                      child: Text(
                        "Login as an affiliate".tr,
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "User name".tr,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 44.h,
                      child: defaultFormField(
                          borderColor: Colors.transparent,
                          borderRadius: 4,
                          hintText: "Enter your user name".tr,
                          fillColor: HexaColor.fromHexa('#F6F6F6'),
                          controller: null,
                          type: TextInputType.text),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      "Password".tr,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 44.h,
                      child: defaultFormField(
                          suffix: Icon(Icons.visibility_off),
                          borderColor: Colors.transparent,
                          borderRadius: 4,
                          hintText: "* * * * * * *",
                          hintStyle: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                          fillColor: HexaColor.fromHexa('#F6F6F6'),
                          controller: null,
                          type: TextInputType.text),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    SizedBox(
                      height: 44.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          "Login".tr,
                        ),
                        onPressed: () async {
                          //  Get.to(() => MainScreen());
                          await Get.offAll(() => WebViewCheck());
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      height: 44.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: "DinNext",
                            ),
                            elevation: 0,
                            primary: HexaColor.fromHexa('#E0E9EB')),
                        child: Text("Single sign-on".tr,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: HexaColor.fromHexa(
                                '#1D7890',
                              ),
                            )),
                        onPressed: () async {
                          try {
                            await Get.offAll(WebViewCheck());
                          } on Exception catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Center(child: Text('Follow us'.tr)),
                    SizedBox(
                      height: 28.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 39.h,
                          width: 39.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexaColor.fromHexa('#E9F2F4'),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/facebook.svg',
                            width: 10.w,
                            height: 18.h,
                            fit: BoxFit.none,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 39.h,
                          width: 39.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexaColor.fromHexa('#E9F2F4'),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/twitter.svg',
                            width: 10.w,
                            height: 18.h,
                            fit: BoxFit.none,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 39.h,
                          width: 39.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexaColor.fromHexa('#E9F2F4'),
                          ),
                          child: Image.asset(
                            'assets/images/instagram.png',
                            width: 10.w,
                            height: 18.h,
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        );
      }),
    );
  }
}
