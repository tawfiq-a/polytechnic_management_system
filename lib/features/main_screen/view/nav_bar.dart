import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/features/main_screen/view/main_screen.dart';
import 'package:poly_manage_systm/features/profile/views/profile_views.dart';
import '../../../core/constants/colors.dart';
import '../../chat/views/chat_main_screen.dart';
import '../controllers/nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  final NavController controller = Get.put(NavController());

  final List<Widget> screens = [ChatInboxView(), MainScreen(), ProfileView()];

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      backgroundColor: AppColors.primary,

      body: Obx(() => screens[controller.currentIndex.value]),

      bottomNavigationBar: SafeArea(
        child: CurvedNavigationBar(
          key: controller.bottomNavigationKey,
          index: controller.currentIndex.value,
          items: const <Widget>[
            Icon(Icons.wechat_outlined, size: 30,color: AppColors.white,),
            Icon(Icons.dashboard, size: 30,color: AppColors.white,),
            Icon(Icons.perm_identity, size: 30,color: AppColors.white,),
          ],
          color: AppColors.primary,
          buttonBackgroundColor: AppColors.primary,
        
          backgroundColor: Colors.transparent,
        
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            controller.changePage(index);
          },
        ),
      ),
    );
  }
}
