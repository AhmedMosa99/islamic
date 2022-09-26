import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_unveristy/moduls/home/controller/home_controller.dart';
import 'package:islamic_unveristy/utils/themes/light_theme.dart';

class IdentifyScreen extends StatelessWidget {
  const IdentifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.w,
          ),
        ),
        title: Text(
          "digitalIdentity".tr,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: GetBuilder<HomeController>(builder: (logic) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: HexaColor.fromHexa('#F2F6F9')),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          height: 130.h,
                          width: 116.51.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 110.51.w,
                            height: 120.14.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/images/person1.jpg',
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "universityOrJobNumber".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: HexaColor.fromHexa("#828282"),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 24.h,
                              child: Text(logic.user!.userInfo!.id.toString()),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'name'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: HexaColor.fromHexa("#828282"),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400),
                            ),
                            Text(logic.user!.userInfo!.userName!),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'JobTitle'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: HexaColor.fromHexa("#828282"),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400),
                            ),
                            Text(
                              logic.user!.userInfo!.department!,
                              style: Theme.of(context).textTheme.bodyText2!,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'theSide'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: HexaColor.fromHexa("#828282"),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400),
                            ),
                            Text(
                              logic.user!.userInfo!.mainDepartment!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'job position'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: HexaColor.fromHexa("#828282"),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400),
                            ),
                            Text(
                              logic.user!.userInfo!.position!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 15.sp),
                            ),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 13.h,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                height: 225.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: HexaColor.fromHexa('#F2F6F9')),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      height: 191.h,
                      width: 191.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: 110.51.w,
                        height: 138.14.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://services.iu.edu.sa/qrbuilder/qrcodeimage/iu-user-public-profile/${logic.user!.userInfo!.userId}',
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
