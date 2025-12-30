import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class EditStudentBottomSheet extends StatefulWidget {
  final Map<String, String> data;
  final Function(Map<String, String>) onUpdate;

  const EditStudentBottomSheet({
    super.key,
    required this.data,
    required this.onUpdate,
  });

  @override
  State<EditStudentBottomSheet> createState() => _EditStudentBottomSheetState();
}

class _EditStudentBottomSheetState extends State<EditStudentBottomSheet> {
  late TextEditingController nameController;
  late TextEditingController rollController;
  late TextEditingController totalController;
  late TextEditingController returnController;
  String? selectedDept;
  String? selectedSem;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.data['name']);
    rollController = TextEditingController(text: widget.data['roll']);
    totalController = TextEditingController(text: widget.data['total']);
    returnController = TextEditingController(text: widget.data['return']);

    selectedDept = widget.data['dept'];
    List<String> deptItems = ['CST', 'ET', 'ENT', 'RAC', 'EMT', 'Computer'];
    if (!deptItems.contains(selectedDept)) selectedDept = null;

    selectedSem = widget.data['sem'];
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
                "Edit Student Info",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter Student Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: rollController,
                decoration: const InputDecoration(
                  labelText: "Roll",
                  hintText: "Enter Student Roll Number",
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
                    .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                    .toList(),
                onChanged: (v) => setState(() => selectedDept = v),
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
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (v) => setState(() => selectedSem = v),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: totalController,
                decoration: const InputDecoration(
                  labelText: "Total Issue",
                  hintText: "000",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: returnController,
                decoration: const InputDecoration(
                  labelText: "Return Issue",
                  hintText: "000",
                  border: OutlineInputBorder(),
                ),
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
                          'name': nameController.text,
                          'roll': rollController.text,
                          'dept': selectedDept ?? '',
                          'sem': selectedSem ?? '',
                          'total': totalController.text,
                          'return': returnController.text,
                          'running': widget.data['running'] ?? '0',
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Update",
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
