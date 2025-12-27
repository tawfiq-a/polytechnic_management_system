import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../base/custom_add_department_bottom_sheet.dart';
import '../base/custom_edit_department_bottom_sheet.dart';

class AddDepartmentScreen extends StatefulWidget {
  const AddDepartmentScreen({super.key});

  @override
  State<AddDepartmentScreen> createState() => _AddDepartmentScreenState();
}

class _AddDepartmentScreenState extends State<AddDepartmentScreen> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> departments = [
    {'name': 'Computer Science and Technology', 'short': 'CST'},
    {'name': 'Civil Technology', 'short': 'CT'},
    {'name': 'Electrical Technology', 'short': 'ET'},
    {'name': 'Mechanical Technology', 'short': 'MT'},
    {'name': 'Electronics Technology', 'short': 'ENT'},
    {'name': 'Electro-medical Technology', 'short': 'EMT'},
    {'name': 'Refrigeration & Air Conditioning Technology', 'short': 'RAC'},
  ];

  List<Map<String, String>> get filteredDepartments {
    final query = searchController.text.toLowerCase();
    return departments.where((d) => d['name']!.toLowerCase().contains(query)).toList();
  }

  void _showAddDepartmentSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => AddDepartmentBottomSheet(
        onAdd: (newDept) {
          setState(() => departments.add(newDept));
        },
      ),
    );
  }

  void _showEditDepartmentSheet(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => EditDepartmentBottomSheet(
        data: departments[index],
        onUpdate: (updated) {
          setState(() => departments[index] = updated);
        },
      ),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Department"),
        content: Text("Are you sure you want to delete '${departments[index]['name']}'?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              setState(() => departments.removeAt(index));
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'Search Semester...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: _showAddDepartmentSheet,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add Department', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDepartments.length,
              itemBuilder: (_, index) {
                final dept = filteredDepartments[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.primary, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(dept['name']!),
                    subtitle: Text("Short Name: ${dept['short']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () => _showEditDepartmentSheet(index)),
                        IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () => _confirmDelete(index)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
