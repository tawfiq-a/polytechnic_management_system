import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String selectedItem = 'Dashboards'; // default selected

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.amber),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(radius: 30, backgroundColor: Colors.white),
                SizedBox(height: 10),
                Text('Institution Name',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ],
            ),
          ),
          _drawerItem('Dashboards', Icons.dashboard, () {
            setState(() => selectedItem = 'Dashboards');

          }),
          _drawerItem('Book Management', Icons.book, () {
            setState(() => selectedItem = 'Book Management');

          }),
          _drawerItem('Issue & Return', Icons.swap_horiz, () {
            setState(() => selectedItem = 'Issue & Return');

          }),
          ExpansionTile(
            leading: const Icon(Icons.category, color: Colors.black),
            title: const Text('Categories', style: TextStyle(color: Colors.black)),
            children: [
              _drawerItem('Add Department', Icons.apartment, () {
                setState(() => selectedItem = 'Add Department');

              }, isSubItem: true),
              _drawerItem('Add Semester', Icons.date_range, () {
                setState(() => selectedItem = 'Add Semester');

              }, isSubItem: true),
            ],
          ),
          _drawerItem('Student Management', Icons.people, () {
            setState(() => selectedItem = 'Student Management');

          }),
          _drawerItem('Profile', Icons.person, () {
            setState(() => selectedItem = 'Profile');

          }),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, IconData icon, VoidCallback onTap,
      {bool isSubItem = false}) {
    final bool isSelected = selectedItem == title;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isSubItem ? 30 : 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.amber : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: isSubItem ? 16 : 16),
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        onTap: onTap,
      ),
    );
  }
}



