import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class EditIssueBottomSheet extends StatefulWidget {
  final Map<String, String> issue;
  final Function(Map<String, String>) onUpdate;

  const EditIssueBottomSheet({
    super.key,
    required this.issue,
    required this.onUpdate,
  });

  @override
  State<EditIssueBottomSheet> createState() => _EditIssueBottomSheetState();
}

class _EditIssueBottomSheetState extends State<EditIssueBottomSheet> {
  late TextEditingController titleController;
  late TextEditingController codeController;
  late TextEditingController issueDateController;
  late TextEditingController returnDateController;
  String? selectedDept;
  String? selectedSem;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.issue['title']);
    codeController = TextEditingController(text: widget.issue['code']);
    issueDateController = TextEditingController(
      text: widget.issue['issueDate'],
    );
    returnDateController = TextEditingController(
      text: widget.issue['returnDate'],
    );

    selectedDept = widget.issue['dept'];
    List<String> deptItems = ['CST', 'ET', 'ENT', 'RAC', 'EMT', 'Computer'];
    if (!deptItems.contains(selectedDept)) selectedDept = null;

    selectedSem = widget.issue['sem'];
    List<String> semItems = [
      '1st',
      '2nd',
      '3rd',
      '4th',
      '5th',
      '6th',
      '7th',
      '8th',
    ];
    if (!semItems.contains(selectedSem)) selectedSem = null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit Issue",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Book Title",
                  hintText: "Enter your book title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  labelText: "Subject Code",
                  hintText: "Enter your book Subject code",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: issueDateController,
                decoration: const InputDecoration(
                  labelText: "Issue Date",
                  hintText: "dd/mm/yyyy",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: returnDateController,
                decoration: const InputDecoration(
                  labelText: "Return Date",
                  hintText: "dd/mm/yyyy",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedDept,
                decoration: const InputDecoration(
                  labelText: "Department",
                  hintText: "Select department",
                  border: OutlineInputBorder(),
                ),
                items: ['CST', 'ET', 'ENT', 'RAC', 'EMT', 'Computer']
                    .map(
                      (dept) =>
                          DropdownMenuItem(value: dept, child: Text(dept)),
                    )
                    .toList(),
                onChanged: (value) => setState(() => selectedDept = value),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedSem,
                decoration: const InputDecoration(
                  labelText: "Semester",
                  hintText: "Select semester",
                  border: OutlineInputBorder(),
                ),
                items: ['1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th']
                    .map(
                      (sem) => DropdownMenuItem(value: sem, child: Text(sem)),
                    )
                    .toList(),
                onChanged: (value) => setState(() => selectedSem = value),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: () {
                        widget.onUpdate({
                          'title': titleController.text,
                          'code': codeController.text,
                          'issueDate': issueDateController.text,
                          'returnDate': returnDateController.text,
                          'dept': selectedDept ?? '',
                          'sem': selectedSem ?? '',
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Update Issue",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
