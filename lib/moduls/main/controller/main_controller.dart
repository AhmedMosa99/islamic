import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:islamic_unveristy/moduls/favourite/views/screens/favourite_screen.dart';
import 'package:islamic_unveristy/moduls/home/views/screens/home_screen.dart';

import '../../more/views/screens/more_screen.dart';

class MainController extends GetxController {
  onItemTapped(int i) {
    selectedIndex = i;
    update();
  }

  List<Widget> screen = const [
    HomeScreen(),
    FavouriteScreen(),
    MoreScreen(),
  ];

  int selectedIndex = 0;
}
