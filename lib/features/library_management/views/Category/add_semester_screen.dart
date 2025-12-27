import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../base/custom_add_semester_bottom_sheet.dart';
import '../base/custom_edit_semester_bottom_sheet.dart';
class AddSemesterScreen extends StatefulWidget {
  const AddSemesterScreen({super.key});

  @override
  State<AddSemesterScreen> createState() => _AddSemesterScreenState();
}

class _AddSemesterScreenState extends State<AddSemesterScreen> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> semesters = [
    {'name': 'First Semester', 'short': '1st'},
    {'name': 'Second Semester', 'short': '2nd'},
    {'name': 'Third Semester', 'short': '3rd'},
    {'name': 'Fourth Semester', 'short': '4th'},
    {'name': 'Fifth Semester', 'short': '5th'},
    {'name': 'Sixth Semester', 'short': '6th'},
    {'name': 'Seventh Semester', 'short': '7th'},
    {'name': 'Eighth Semester', 'short': '8th'},
  ];

  List<Map<String, String>> get filteredSemesters {
    final query = searchController.text.toLowerCase();
    return semesters.where((s) => s['name']!.toLowerCase().contains(query)).toList();
  }

  void _showAddSemesterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => AddSemesterBottomSheet(
        onAdd: (newSem) {
          setState(() => semesters.add(newSem));
        },
      ),
    );
  }

  void _showEditSemesterSheet(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => EditSemesterBottomSheet(
        data: semesters[index],
        onUpdate: (updated) {
          setState(() => semesters[index] = updated);
        },
      ),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Semester"),
        content: Text("Are you sure you want to delete '${semesters[index]['name']}'?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              setState(() => semesters.removeAt(index));
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
                onPressed: _showAddSemesterSheet,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add Semester', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSemesters.length,
              itemBuilder: (_, index) {
                final sem = filteredSemesters[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.primary, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(sem['name']!),
                    subtitle: Text("Short Name: ${sem['short']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () => _showEditSemesterSheet(index)),
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
