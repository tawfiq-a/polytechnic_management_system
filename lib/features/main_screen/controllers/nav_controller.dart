import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NavController extends GetxController {
  var currentIndex = 1.obs;
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  void changePage(int index) {
    currentIndex.value = index;
  }

  void animateToPage(int index) {
    bottomNavigationKey.currentState?.setPage(index);
  }
}
