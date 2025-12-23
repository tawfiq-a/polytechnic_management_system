import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/features/exam_control/views/seat_plan.dart';
import '../controllers/exm_controller.dart';
import 'assign_screen.dart';
import 'exam_dashboard.dart';
import 'exam_routine_content.dart';

class ExamView extends StatelessWidget {
  final controller = Get.put(ExamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Exam Management System",
          style: TextStyle(
            color: Color(0xFF003D4D),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),

      endDrawer: _buildDrawer(),
      body: Obx(() {

        switch (controller.selectedIndex.value) {
          case 0:
            return DashboardSection();
          case 1:
            return RoutineSection();
          case 2:
            return SeatPlan();
          case 3:
            return AssignScreen();
          default:
            return const Center(child: Text("Coming Soon..."));
        }
      }),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber[200],
              border: Border.all(color: Colors.amber),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset("assets/images/img.png"),
            ),
          ),
          _drawerTile(0, Icons.grid_view_rounded, "Dashboards"),
          _drawerTile(1, Icons.assignment_outlined, "Exam Routine"),
          _drawerTile(2, Icons.event_seat_outlined, "Manage Set Plan"),
          _drawerTile(3, Icons.person_add_alt_1_outlined, "Assign"),
          const Spacer(),
          _drawerTile(-1, Icons.logout, "Log out", isLogout: true),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _drawerTile(
    int index,
    IconData icon,
    String title, {
    bool isLogout = false,
  }) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;
      return ListTile(
        onTap: () => isLogout ? null : controller.changeMenu(index),
        leading: Icon(
          icon,
          color: isSelected
              ? Colors.black
              : (isLogout ? Colors.red : Colors.grey),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Colors.black
                : (isLogout ? Colors.red : Colors.black87),
          ),
        ),
        tileColor: isSelected ?  Colors.amber : Colors.transparent,
      );
    });
  }

}
