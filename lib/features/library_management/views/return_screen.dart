import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

import 'base/custom_add_return_bottom_sheet.dart';
import 'base/custom_edit_return_bottom_sheet.dart';


class ReturnScreen extends StatefulWidget {
  const ReturnScreen({super.key});

  @override
  State<ReturnScreen> createState() => _ReturnScreenState();
}

class _ReturnScreenState extends State<ReturnScreen> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> returns = [
    {
      'roll': '652330',
      'code': '28022',
      'dept': 'Computer',
      'sem': '2nd',
      'returnDate': '05/06/2025',
    },
  ];

  List<Map<String, String>> get filteredReturns {
    final query = searchController.text.toLowerCase();
    return returns.where((r) => r['roll']!.toLowerCase().contains(query)).toList();
  }

  void _showAddReturnSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => AddReturnBottomSheet(
        onAdd: (newReturn) {
          setState(() => returns.add(newReturn));
        },
      ),
    );
  }

  void _showEditReturnSheet(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => EditReturnBottomSheet(
        data: returns[index],
        onUpdate: (updated) {
          setState(() => returns[index] = updated);
        },
      ),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Return"),
        content: Text("Are you sure you want to delete return for roll ${returns[index]['roll']}?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              setState(() => returns.removeAt(index));
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
                    hintText: 'Search Student Issue Roll...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: _showAddReturnSheet,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add Return', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredReturns.length,
              itemBuilder: (_, index) {
                final r = filteredReturns[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.primary, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text("Roll: ${r['roll']} | Code: ${r['code']}"),
                    subtitle: Text("Dept: ${r['dept']} | Sem: ${r['sem']} | Return: ${r['returnDate']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () => _showEditReturnSheet(index)),
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
