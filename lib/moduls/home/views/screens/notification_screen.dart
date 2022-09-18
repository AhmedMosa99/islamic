import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:islamic_unveristy/moduls/home/controller/home_controller.dart';
import 'package:islamic_unveristy/utils/themes/light_theme.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
          "notification".tr,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: GetBuilder<HomeController>(builder: (logic) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              DateTime dt = DateTime.parse(
                  logic.notificationModel!.records![index].startTime!);

              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: HexaColor.fromHexa('#005A85').withOpacity(0.1)),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                height: 129.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          logic.notificationModel!.records![index].title!,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              logic
                                  .notificationModel!.records![index].category!,
                              style: TextStyle(
                                color: HexaColor.fromHexa('#F2994A'),
                              ),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            SvgPicture.asset(
                              'assets/images/Vector (6).svg',
                              width: 17.w,
                              height: 17.h,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      logic.notificationModel!.records![index].description!,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: HexaColor.fromHexa('#4F4F4F')),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            DateTime.parse(logic.notificationModel!
                                    .records![index].startTime!)
                                .toString()
                                .split(' ')
                                .first,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    color: HexaColor.fromHexa('#4F4F4F'),
                                    fontSize: 15.sp))
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 14.h,
              );
            },
            itemCount: logic.notificationModel!.records!.length,
          ),
        );
      }),
    );
  }
}
