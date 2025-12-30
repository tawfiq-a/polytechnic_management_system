import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';
import 'package:poly_manage_systm/features/polytechnic_management/views/instructor_info_view.dart';
import 'package:poly_manage_systm/features/polytechnic_management/views/student_info.dart';
import '../../profile/views/departments.dart';
import '../controllers/drawer_controller.dart';

class PolyMain extends StatelessWidget {
  final polyController controller = Get.put(polyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "Institute Management System",
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
            _drawerItem(0, Icons.person, "Student Info"),
            _drawerItem(1, Icons.military_tech, "Instructor info"),
            _drawerItem(2, Icons.school_outlined, "Academy"),
            const Spacer(),
            const ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Log out", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.selectedIndex.value == 0) return StudentInfoView();
        if (controller.selectedIndex.value == 1) return InstructorInfoView();
        if (controller.selectedIndex.value == 2) {
          return const DepartmentListView();
        }
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
