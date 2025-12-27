import 'package:flutter/material.dart';
import 'base/custom_drawer.dart';
import 'package:poly_manage_systm/features/library_management/views/dashboard_screen.dart';
// import other screens here...

import 'dashoard_views.dart';
// import other screens here...

class LibraryManagement extends StatefulWidget {
  const LibraryManagement({super.key});

  @override
  State<LibraryManagement> createState() => _LibraryManagementState();
}

class _LibraryManagementState extends State<LibraryManagement> {
  String selectedItem = 'Dashboards'; // default

  Widget getScreen() {
    switch (selectedItem) {
      case 'Dashboards':
        return const DashboardScreen();
      case 'Book Management':
        return const Center(child: Text('Book Management Screen'));
      case 'Issue & Return':
        return const Center(child: Text('Issue & Return Screen'));
      case 'Add Department':
        return const Center(child: Text('Department Screen'));
      case 'Add Semester':
        return const Center(child: Text('Semester Screen'));
      case 'Student Management':
        return const Center(child: Text('Student Management Screen'));
      case 'Profile':
        return const Center(child: Text('Profile Screen'));
      default:
        return const DashboardScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(selectedItem)),
      drawer: CustomDrawer(
        selectedItem: selectedItem,
        onItemSelected: (item) {
          setState(() => selectedItem = item);
          Navigator.pop(context);
        },
      ),
      body: getScreen(),
    );
  }
}