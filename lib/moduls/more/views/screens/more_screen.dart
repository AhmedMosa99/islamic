import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:islamic_unveristy/moduls/auth/view/screen/begin_screen.dart';
import 'package:islamic_unveristy/moduls/auth/view/screen/login.dart';
import 'package:islamic_unveristy/moduls/home/controller/home_controller.dart';
import 'package:islamic_unveristy/moduls/more/views/screens/privacy_police.dart';
import 'package:islamic_unveristy/moduls/more/views/screens/term_condition.dart';
import 'package:islamic_unveristy/services/local_data/share_pref.dart';
import 'package:islamic_unveristy/shared/constant.dart';
import 'package:islamic_unveristy/utils/themes/light_theme.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(
            "more".tr,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                width: 130.51.w,
                height: 130.14.h,
                decoration: BoxDecoration(
                    color: HexaColor.fromHexa('#FEFEFE'),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/img.png",
                      ),
                    )),
              )),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  logic.user!.userInfo!.userName == null
                      ? ""
                      : logic.user!.userInfo!.userName!,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              InkWell(
                  onTap: () {
                    Get.to(() => PrivacyPolicyScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/privacy.svg'),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text("privacyPolice".tr),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18.w,
                        color: HexaColor.fromHexa('#333333'),
                      )
                    ],
                  )),
              SizedBox(
                height: 15.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => TermConditionScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/listview.svg'),
                        SizedBox(
                          width: 18.w,
                        ),
                        Text("termCondition".tr),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.w,
                      color: HexaColor.fromHexa('#333333'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  onTap: () async {
                    await SharePref.init();
                    await SharePref.removeKey('token');
                    token = null;
                    Get.offAll(BeginScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/logout.svg'),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text("logout".tr),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () async {
                            await SharePref.init();
                            await SharePref.removeKey('token');
                            token = null;
                            Get.offAll(BeginScreen());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 18.w,
                            color: HexaColor.fromHexa('#333333'),
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 15.h,
              ),
              Divider(),
            ],
          ),
        ),
      );
    });
  }
}
