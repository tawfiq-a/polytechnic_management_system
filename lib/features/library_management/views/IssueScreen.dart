import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'base/custom_add_issue_bottom_sheet.dart';
import 'base/custom_edit_issue_bottom_sheet.dart';
class IssueScreen extends StatefulWidget {
  const IssueScreen({super.key});

  @override
  State<IssueScreen> createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> issues = [
    {
      'title': 'Database Systems',
      'code': '28022',
      'issueDate': '29/12/2025',
      'returnDate': '05/01/2026',
      'dept': 'Computer',
      'sem': '2nd',
    },
    {
      'title': 'Network Security',
      'code': '28023',
      'issueDate': '30/12/2025',
      'returnDate': '06/01/2026',
      'dept': 'Computer',
      'sem': '2nd',
    },
  ];

  List<Map<String, String>> get filteredIssues {
    final query = searchController.text.toLowerCase();
    return issues.where((issue) => issue['title']!.toLowerCase().contains(query)).toList();
  }

  void _showAddIssueSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => AddIssueBottomSheet(
        onAdd: (newIssue) {
          setState(() => issues.add(newIssue));
        },
      ),
    );
  }

  void _showEditIssueSheet(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => EditIssueBottomSheet(
        issue: issues[index],
        onUpdate: (updatedIssue) {
          setState(() => issues[index] = updatedIssue);
        },
      ),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Issue"),
        content: Text("Are you sure you want to delete '${issues[index]['title']}'?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              setState(() => issues.removeAt(index));
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
                    hintText: 'Search Book Title...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: _showAddIssueSheet,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add Issue', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredIssues.length,
              itemBuilder: (_, index) {
                final issue = filteredIssues[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.primary, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(issue['title']!),
                    subtitle: Text(
                      'Code: ${issue['code']} | Issue: ${issue['issueDate']} | Return: ${issue['returnDate']} | Dept: ${issue['dept']} | Sem: ${issue['sem']}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showEditIssueSheet(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _confirmDelete(index),
                        ),
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
