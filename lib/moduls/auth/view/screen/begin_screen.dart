import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:islamic_unveristy/moduls/auth/view/screen/login.dart';
import 'package:islamic_unveristy/moduls/home/views/screens/home_screen.dart';
import 'package:islamic_unveristy/moduls/main/views/screens/mainScreen.dart';
import 'package:islamic_unveristy/services/local_data/share_pref.dart';

import '../../../../shared/constant.dart';
import '../../../../utils/themes/light_theme.dart';

class BeginScreen extends StatefulWidget {
  const BeginScreen({Key? key}) : super(key: key);

  @override
  State<BeginScreen> createState() => _BeginScreenState();
}

class _BeginScreenState extends State<BeginScreen> {
  List<String> items = ["EN,AR"];
  String dropdownValue = "EN";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.h,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Color(0xffffffff),
            statusBarBrightness: Brightness.light),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //
              //         child: Text('EN',
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .subtitle1!
              //                 .copyWith(
              //                     fontSize: 16.sp,
              //                     color: HexaColor.fromHexa('#242424')))),
              //     SizedBox(width: 5.w),
              //     Icon(
              //       Icons.keyboard_arrow_down_sharp,
              //       size: 25.w,
              //       color: HexaColor.fromHexa('#242424'),
              //     )
              //   ],
              // ),
              Align(
                alignment:
                    lang == "ar" ? Alignment.topLeft : Alignment.topRight,
                child: SizedBox(
                  height: 50,
                  width: 50.w,
                  child: DropdownButtonHideUnderline(
                    child: GFDropdown(
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(5),
                      dropdownButtonColor: Colors.white,
                      value: dropdownValue,
                      onChanged: (newValue) async {
                        setState(() {
                          dropdownValue = newValue.toString();
                        });
                        if (dropdownValue == "EN") {
                          Get.updateLocale(Locale("en"));
                          lang = "en";
                          await SharePref.setData(key: 'lang', data: lang);
                        } else if (dropdownValue == "AR") {
                          Get.updateLocale(Locale("ar"));
                          lang = "ar";
                          await SharePref.setData(key: 'lang', data: lang);
                        }
                      },
                      items: ['EN', 'AR']
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  'Welcome to the Islamic University'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: "DinNext"),
                ),
              ),
              SizedBox(
                height: 112.h,
              ),
              Center(
                child: Image.asset(
                  "assets/images/img.png",
                  width: 190.w,
                  height: 190.h,
                ),
              ),
              SizedBox(
                height: 122.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By continuing, you agree'.tr + " ",
                    style: TextStyle(
                      fontFamily: "DinNext",
                      fontSize: 16.sp,
                      color: HexaColor.fromHexa('#393939'),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'to the terms & conditions and Privacy Policy'.tr,
                          style:
                              TextStyle(color: HexaColor.fromHexa('#023CB1'))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              SizedBox(
                height: 44.h,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Login as an affiliate".tr),
                  onPressed: () async {
                    await Get.to(() => LoginScreen());
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
                  child: Text("Login as a visitor".tr,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: HexaColor.fromHexa(
                          '#1D7890',
                        ),
                      )),
                  onPressed: () async {
                    await Get.to(MainScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
