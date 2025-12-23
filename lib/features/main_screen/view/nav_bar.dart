import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/features/main_screen/view/main_screen.dart';

import '../controllers/nav_controller.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          "Chat Screen",
          style: TextStyle(fontSize: 30, color: Colors.amber),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(fontSize: 30, color: Colors.amber),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final NavController controller = Get.put(NavController());

  final List<Widget> screens = [ChatScreen(), MainScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      backgroundColor: Colors.amber,

      body: Obx(() => screens[controller.currentIndex.value]),

      bottomNavigationBar: CurvedNavigationBar(
        key: controller.bottomNavigationKey,
        index: controller.currentIndex.value,
        items: const <Widget>[
          Icon(Icons.wechat_outlined, size: 30),
          Icon(Icons.dashboard, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.amber,
        buttonBackgroundColor: Colors.amber,

        backgroundColor: Colors.transparent,

        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          controller.changePage(index);
        },
      ),
    );
  }
}
