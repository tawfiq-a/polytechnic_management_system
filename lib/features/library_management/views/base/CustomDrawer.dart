import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Image.asset("assets/images/img.png")),
          ),

          // Dashboard
          _drawerItem(0, Icons.grid_view_rounded, "Dashboards"),

          // Book Management with sub-items
          ExpansionTile(
            leading: const Icon(Icons.book, color: Colors.black),
            title: const Text(
              "Book Management",
              style: TextStyle(color: Colors.black),
            ),
            children: [
              _drawerItem(10, Icons.add, "Add Book", isSubItem: true),
              _drawerItem(11, Icons.edit, "Edit Book", isSubItem: true),
            ],
          ),

          // Issue & Return
          _drawerItem(1, Icons.call_received, "Issue"),
          _drawerItem(2, Icons.call_made, "Return"),

          // Categories with sub-items
          ExpansionTile(
            leading: const Icon(Icons.category, color: Colors.black),
            title: const Text(
              "Categories",
              style: TextStyle(color: Colors.black),
            ),
            children: [
              _drawerItem(
                12,
                Icons.apartment,
                "Add Department",
                isSubItem: true,
              ),
              _drawerItem(
                13,
                Icons.date_range,
                "Add Semester",
                isSubItem: true,
              ),
            ],
          ),

          // Student Management
          _drawerItem(3, Icons.people, "Student Management"),
        ],
      ),
    );
  }

  Widget _drawerItem(
    int index,
    IconData icon,
    String title, {
    bool isLogout = false,
    bool isSubItem = false,
  }) {
    final bool isSelected = selectedIndex == index;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isSubItem ? 30 : 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: () {
          if (!isLogout) {
            onItemSelected(index);
            scaffoldKey.currentState?.closeEndDrawer();
          }
        },
        leading: Icon(
          icon,
          color: isSelected
              ? Colors.white
              : (isLogout ? Colors.red : Colors.grey),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : (isLogout ? Colors.red : Colors.black87),
          ),
        ),
      ),
    );
  }
}
