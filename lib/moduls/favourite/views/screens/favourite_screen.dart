import 'package:flutter/material.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';import 'package:flutter_svg/flutter_svg.dart';import 'package:font_awesome_flutter/font_awesome_flutter.dart';import 'package:get/get.dart';import 'package:islamic_unveristy/moduls/home/controller/home_controller.dart';import 'package:islamic_unveristy/moduls/home/views/screens/clender_screen.dart';import 'package:islamic_unveristy/moduls/home/views/screens/identify_screen.dart';import 'package:islamic_unveristy/utils/themes/light_theme.dart';import 'package:url_launcher/url_launcher.dart';import '../../../home/views/screens/news.dart';class FavouriteScreen extends StatefulWidget {  const FavouriteScreen({Key? key}) : super(key: key);  @override  State<FavouriteScreen> createState() => _FavouriteScreenState();}class _FavouriteScreenState extends State<FavouriteScreen>    with SingleTickerProviderStateMixin {  late AnimationController _controller;  @override  void initState() {    super.initState();    _controller = AnimationController(vsync: this);  }  @override  void dispose() {    _controller.dispose();    super.dispose();  }  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(        leading: Container(),        title: Text(          "favourite".tr,          style: Theme.of(context)              .textTheme              .subtitle1!              .copyWith(fontWeight: FontWeight.w500, color: Colors.white),        ),      ),      body: GetBuilder<HomeController>(builder: (logic) {        return SafeArea(          child: Column(            children: [              SizedBox(                height: 18.h,              ),              Padding(                padding: EdgeInsets.symmetric(horizontal: 16.0.w),                child: Row(                  mainAxisAlignment: MainAxisAlignment.spaceBetween,                  children: [                    Text(                      'allServices'.tr,                      style: const TextStyle(fontWeight: FontWeight.w500),                    ),                    Container(                      height: 34.h,                      width: 100.w,                      decoration: BoxDecoration(                          borderRadius: BorderRadius.circular(3),                          border: Border.all(                            color: HexaColor.fromHexa('#BDBDBD'),                          )),                      child: Row(                        children: [                          Expanded(                              flex: 1,                              child: IconButton(                                  onPressed: () {                                    logic.changeView(false);                                  },                                  icon: SvgPicture.asset(                                    'assets/images/listview.svg',                                    width: 18.h,                                    height: 18.w,                                    fit: BoxFit.fill,                                    color: !logic.isGrid                                        ? HexaColor.fromHexa('#333333')                                        : HexaColor.fromHexa('#BDBDBD'),                                  ))),                          VerticalDivider(                            color: HexaColor.fromHexa('#BDBDBD'),                            thickness: 1,                          ),                          Expanded(                              flex: 1,                              child: IconButton(                                  onPressed: () {                                    logic.changeView(true);                                  },                                  icon: SvgPicture.asset(                                    'assets/images/gridview.svg',                                    height: 18.h,                                    width: 18.w,                                    fit: BoxFit.fill,                                    color: logic.isGrid                                        ? HexaColor.fromHexa('#333333')                                        : HexaColor.fromHexa('#BDBDBD'),                                  ))),                        ],                      ),                    ),                  ],                ),              ),              if (!logic.isGrid) SizedBox(height: 20.h),              // if (!logic.isGrid) SizedBox(height: 15.h),              if (!logic.isGrid)                Flexible(                  child: Padding(                      padding: EdgeInsets.symmetric(horizontal: 16.w),                      child: buildListView(context)),                ),              SizedBox(height: 10.h),              if (logic.isGrid)                Flexible(                    child: Padding(                        padding: EdgeInsets.symmetric(                            horizontal: 16.w, vertical: 10.h),                        child: buildGridView(context))),              SizedBox(height: 20.h),            ],          ),        );      }),    );  }}class ItemView extends StatelessWidget {  const ItemView({    Key? key,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return Container(      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),      decoration: BoxDecoration(color: HexaColor.fromHexa('#F2F6F9')),      height: 54.h,      child: Row(        mainAxisAlignment: MainAxisAlignment.spaceBetween,        children: [          Row(            crossAxisAlignment: CrossAxisAlignment.center,            children: [              Image.asset(                'assets/images/Group.png',                width: 29.w,                height: 29.h,                fit: BoxFit.none,              ),              SizedBox(                width: 14.w,              ),              Text(                'هوية رقمية',                style: Theme.of(context).textTheme.subtitle2,              ),            ],          ),          Icon(            Icons.star,            size: 20.w,            color: HexaColor.fromHexa('#E5A96B'),          )        ],      ),    );  }}class ItemGrid extends StatelessWidget {  void Function()? fun;  ItemGrid({    required this.fun,    Key? key,  }) : super(key: key);  @override  Widget build(BuildContext context) {    return GestureDetector(        onTap: fun,        child: Container(          padding: EdgeInsets.all(8),          width: 107.w,          height: 90.h,          decoration: BoxDecoration(            color: HexaColor.fromHexa('#F2F6F9'),            borderRadius: BorderRadius.circular(4),          ),          child: Column(            children: [              Align(                  alignment: Alignment.topLeft,                  child: Icon(                    Icons.star,                    size: 20.w,                    color: HexaColor.fromHexa('#E5A96B'),                  )),              Center(                child: Image.asset(                  'assets/images/Group.png',                  width: 29.w,                  height: 29.h,                  fit: BoxFit.fill,                ),              ),              Center(                  child: Text(                "الاخبار",                style: Theme.of(context).textTheme.subtitle2,              ))            ],          ),        ));  }}buildGridView(BuildContext context) {  return GetBuilder<HomeController>(builder: (logic) {    return GridView.builder(      itemCount: logic.list.length,      padding: EdgeInsets.zero,      primary: true,      itemBuilder: (BuildContext context, int index) {        return GestureDetector(            onTap: () async {              if (index == 0) {                Get.to(IdentifyScreen());              }              if (index == 1) {                Get.to(NewsScreen());              }              if (index == 3) {                Get.to(CalendarScreen());              } else {                await launchUrl(Uri.parse(logic.list[index].url!));              }            },            child: Container(              padding: EdgeInsets.all(8),              width: 107.w,              height: 90.h,              decoration: BoxDecoration(                color: HexaColor.fromHexa('#F2F6F9'),                borderRadius: BorderRadius.circular(4),              ),              child: Column(                children: [                  Align(                      alignment: Alignment.topLeft,                      child: Icon(                        Icons.star,                        size: 20.w,                        color: HexaColor.fromHexa('#E5A96B'),                      )),                  Center(                    child: Image.asset(                      'assets/images/Group.png',                      width: 29.w,                      height: 29.h,                      fit: BoxFit.fill,                    ),                  ),                  Center(                      child: Text(                    logic.list[index].title!,                    textAlign: TextAlign.center,                    style: Theme.of(context).textTheme.subtitle2,                  ))                ],              ),            ));      },      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(        crossAxisSpacing: 11.w,        mainAxisSpacing: 11.h,        crossAxisCount: 2,        childAspectRatio: 1.3,      ),    );  });}buildListView(BuildContext context) {  return GetBuilder<HomeController>(    builder: (logic) {      //    print(logic.helper.getIconByName('adduser'));      return ListView.separated(        itemCount: logic.list.length,        itemBuilder: (BuildContext context, int index) {          return InkWell(            onTap: () async {              await launchUrl(Uri.parse(logic.list[index].url!));            },            child: Container(              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),              decoration: BoxDecoration(color: HexaColor.fromHexa('#F2F6F9')),              height: 54.h,              child: Row(                mainAxisAlignment: MainAxisAlignment.spaceBetween,                children: [                  Row(                    crossAxisAlignment: CrossAxisAlignment.center,                    children: [                      // FaIcon((logic.helper.getIconByName('accusoft'))),                      FaIcon(Icons.abc),                      SizedBox(                        width: 14.w,                      ),                      Text(                        logic.list[index].title!,                        style: Theme.of(context)                            .textTheme                            .subtitle2!                            .copyWith(fontSize: 14.sp),                      ),                    ],                  ),                  Icon(                    Icons.star,                    size: 20.w,                    color: HexaColor.fromHexa('#E5A96B'),                  )                ],              ),            ),          );        },        separatorBuilder: (BuildContext context, int index) {          return SizedBox(            height: 10.h,          );        },      );    },  );}