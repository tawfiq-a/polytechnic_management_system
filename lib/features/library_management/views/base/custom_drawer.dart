import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String selectedItem;
  final Function(String) onItemSelected;

  const CustomDrawer({
    super.key,
    required this.selectedItem,
    required this.onItemSelected,
  });

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
          _drawerItem('Dashboards', Icons.dashboard),
          _drawerItem('Book Management', Icons.book),
          _drawerItem('Issue & Return', Icons.swap_horiz),
          ExpansionTile(
            leading: const Icon(Icons.category, color: Colors.black),
            title: const Text('Categories', style: TextStyle(color: Colors.black)),
            children: [
              _drawerItem('Add Department', Icons.apartment, isSubItem: true),
              _drawerItem('Add Semester', Icons.date_range, isSubItem: true),
            ],
          ),
          _drawerItem('Student Management', Icons.people),
          _drawerItem('Profile', Icons.person),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, IconData icon, {bool isSubItem = false}) {
    final bool isSelected = selectedItem == title;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isSubItem ? 30 : 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.amber : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: const TextStyle(color: Colors.black)),
        onTap: () => onItemSelected(title),
      ),
    );
  }
}
