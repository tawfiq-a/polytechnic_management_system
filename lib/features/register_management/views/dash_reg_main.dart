import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';
import 'package:poly_manage_systm/features/register_management/views/payment_content.dart';
import 'package:poly_manage_systm/features/register_management/views/student_content.dart';
import '../controllers/dashboard_controller.dart';
import 'dashboard_content.dart';

class MainView extends StatelessWidget {
  final AppController controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "Register Management System",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset("assets/images/img.png"),
              ),
            ),
            _drawerItem(0, Icons.grid_view_rounded, "Dashboards"),
            _drawerItem(1, Icons.school_outlined, "Student"),
            _drawerItem(2, Icons.payment_outlined, "Payment"),
            const Spacer(),
            const ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Log out", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.selectedIndex.value == 0) return DashboardContent();
        if (controller.selectedIndex.value == 1) return StudentContent();
        if (controller.selectedIndex.value == 2) return const PaymentContent();
        return Container();
      }),
    );
  }

  Widget _drawerItem(int index, IconData icon, String title) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;
      return ListTile(
        onTap: () {
          controller.changeMenu(index);
          Get.back();
        },
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : AppColors.primary,
        ),
        title: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
        tileColor: isSelected ? AppColors.primary : Colors.transparent,
      );
    });
  }
}
