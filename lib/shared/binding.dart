import 'package:get/get.dart';
import 'package:islamic_unveristy/moduls/auth/controller/controller.dart';
import 'package:islamic_unveristy/moduls/home/controller/home_controller.dart';
import 'package:islamic_unveristy/moduls/main/controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(AuthController());
    Get.put(HomeController());
  }
}
