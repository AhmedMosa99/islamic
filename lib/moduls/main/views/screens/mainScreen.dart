import 'package:flutter/material.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';import 'package:flutter_svg/svg.dart';import 'package:get/get.dart';import 'package:islamic_unveristy/moduls/main/controller/main_controller.dart';import '../../../../utils/themes/light_theme.dart';class MainScreen extends StatelessWidget {  const MainScreen({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return GetBuilder<MainController>(builder: (logic) {      return Scaffold(        body: logic.screen[logic.selectedIndex],        bottomNavigationBar: BottomNavigationBar(          type: BottomNavigationBarType.fixed,          onTap: logic.onItemTapped,          currentIndex: logic.selectedIndex,          items: <BottomNavigationBarItem>[            BottomNavigationBarItem(              icon: SvgPicture.asset(                'assets/images/home.svg',                width: 22.w,                height: 20.h,                color: logic.selectedIndex == 0                    ? Theme.of(context).primaryColor                    : HexaColor.fromHexa('#828282'),              ),              label: 'home'.tr,            ),            BottomNavigationBarItem(              icon: SvgPicture.asset(                'assets/images/favourite.svg',                width: 22.w,                height: 20.h,                color: logic.selectedIndex == 1                    ? Theme.of(context).primaryColor                    : HexaColor.fromHexa('#828282'),              ),              label: 'favourite'.tr,            ),            BottomNavigationBarItem(              icon: SvgPicture.asset('assets/images/more.svg',                  width: 22.w,                  height: 20.h,                  fit: BoxFit.none,                  color: logic.selectedIndex == 2                      ? Theme.of(context).primaryColor                      : HexaColor.fromHexa('#828282')),              label: 'more'.tr,            ),          ],        ),      );    });  }}