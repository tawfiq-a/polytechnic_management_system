import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'base/custom_edit_student_bottom_sheet.dart';

class StudentManagementScreen extends StatefulWidget {
  const StudentManagementScreen({super.key});

  @override
  State<StudentManagementScreen> createState() => _StudentManagementScreenState();
}

class _StudentManagementScreenState extends State<StudentManagementScreen> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> students = [
    {
      'name': 'Tiana',
      'roll': '28545',
      'dept': 'CST',
      'sem': '1st',
      'total': '50',
      'return': '150',
      'running': '2',
    },
    {
      'name': 'Tiaa',
      'roll': '28545',
      'dept': 'CST',
      'sem': '1st',
      'total': '50',
      'return': '150',
      'running': '2',
    },
  ];

  List<Map<String, String>> get filteredStudents {
    final query = searchController.text.toLowerCase();
    return students.where((s) =>
    s['name']!.toLowerCase().contains(query) || s['roll']!.contains(query)
    ).toList();
  }

  void _showEditStudentSheet(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => EditStudentBottomSheet(
        data: students[index],
        onUpdate: (updated) {
          setState(() => students[index] = updated);
        },
      ),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Student"),
        content: Text("Are you sure you want to delete '${students[index]['name']}'?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              setState(() => students.removeAt(index));
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
          TextField(
            controller: searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Search student name or roll...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredStudents.length,
              itemBuilder: (_, index) {
                final s = filteredStudents[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.primary, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text("${s['name']} (${s['roll']})"),
                    subtitle: Text("Dept: ${s['dept']} | Sem: ${s['sem']} | Total: ${s['total']} | Return: ${s['return']} | Running: ${s['running']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () => _showEditStudentSheet(index)),
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
