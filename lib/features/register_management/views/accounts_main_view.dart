import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/features/register_management/views/payment_view.dart';
import 'package:poly_manage_systm/features/register_management/views/self_details.dart';
import '../controllers/register_controller.dart';

import 'doc_req_view.dart';

class AccountsMainView extends StatelessWidget {
  final controller = Get.put(AccountsController());

    AccountsMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.selectedIndex.value == 0
                ? "Payment System"
                : controller.selectedIndex.value == 1
                ? "Self Details"
                : "Document Request",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF003D4D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      endDrawer: _buildAppDrawer(),
      body: Obx(() {
        if (controller.selectedIndex.value == 0) return PaymentScreen();
        if (controller.selectedIndex.value == 1) return SelfDetailsScreen();
        return DocumentRequestScreen();
      }),
    );
  }

  Widget _buildAppDrawer() {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF003D4D)),
            child: Center(
              child: Icon(Icons.account_circle, size: 80, color: Colors.white),
            ),
          ),
          _drawerTile(0, Icons.payment, "Payment Option"),
          _drawerTile(1, Icons.person_outline, "Self Details"),
          _drawerTile(2, Icons.description_outlined, "Document Request"),
          const Spacer(),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _drawerTile(int index, IconData icon, String title) {
    return Obx(
      () => ListTile(
        selected: controller.selectedIndex.value == index,
        selectedTileColor: const Color(0xFF003D4D).withOpacity(0.1),
        leading: Icon(
          icon,
          color: controller.selectedIndex.value == index
              ? const Color(0xFF003D4D)
              : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: controller.selectedIndex.value == index
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        onTap: () => controller.changeMenu(index),
      ),
    );
  }
}
