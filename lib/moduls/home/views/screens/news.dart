import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_unveristy/moduls/home/controller/home_controller.dart';
import 'package:islamic_unveristy/utils/themes/light_theme.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

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
          "news".tr,
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
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: HexaColor.fromHexa('##F2F6F9'),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8.0), //add border radius
                      child: Image.asset(
                        'assets/images/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg',
                        width: 93.w,
                        height: 93.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              logic.newsModel!.records![index].title!,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text("12/8/2022",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        color: HexaColor.fromHexa('#4F4F4F'),
                                        fontSize: 15.sp))
                          ],
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Text(
                          logic.newsModel!.records![index].description!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: HexaColor.fromHexa('#4F4F4F')),
                        ),
                      ],
                    )),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 14.h,
              );
            },
            itemCount: logic.newsModel!.records!.length,
          ),
        );
      }),
    );
  }
}
