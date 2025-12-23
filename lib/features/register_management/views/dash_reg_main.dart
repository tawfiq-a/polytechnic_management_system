import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/features/register_management/views/student_content.dart';
import '../controllers/dashboard_controller.dart';
import 'dashboard_content.dart';


class MainView extends StatelessWidget {
  final AppController controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Management System", style: TextStyle(color: Color(0xFF003D4D), fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          const Icon(Icons.notifications_none_outlined),
          const SizedBox(width: 15),
          CircleAvatar(backgroundColor: Colors.grey[300], child: const Icon(Icons.person)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Wilson", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black)),
                Text("Admin", style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
      // আপনার চাহিদা অনুযায়ী সাইডবারটি ড্রয়ারে থাকবে
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10),
                child: Image.network('https://via.placeholder.com/100'), // আপনার লোগো দিন
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
        // ইন্ডেক্স অনুযায়ী স্ক্রিন লোড হবে
        if (controller.selectedIndex.value == 0) return DashboardContent();
        if (controller.selectedIndex.value == 1) return StudentContent();
        return const Center(child: Text("Payment Content Coming Soon"));
      }),
    );
  }

  Widget _drawerItem(int index, IconData icon, String title) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;
      return ListTile(
        onTap: () {
          controller.changeMenu(index);
          Get.back(); // ড্রয়ার বন্ধ করতে
        },
        leading: Icon(icon, color: isSelected ? Colors.white : Colors.grey),
        title: Text(title, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
        tileColor: isSelected ? const Color(0xFF003D4D) : Colors.transparent,
      );
    });
  }
}