import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class EditReturnBottomSheet extends StatefulWidget {
  final Map<String, String> data;
  final Function(Map<String, String>) onUpdate;

  const EditReturnBottomSheet({
    super.key,
    required this.data,
    required this.onUpdate,
  });

  @override
  State<EditReturnBottomSheet> createState() => _EditReturnBottomSheetState();
}

class _EditReturnBottomSheetState extends State<EditReturnBottomSheet> {
  late TextEditingController rollController;
  late TextEditingController codeController;
  late TextEditingController returnDateController;
  String? selectedDept;
  String? selectedSem;

  @override
  void initState() {
    super.initState();
    rollController = TextEditingController(text: widget.data['roll']);
    codeController = TextEditingController(text: widget.data['code']);
    returnDateController = TextEditingController(
      text: widget.data['returnDate'],
    );

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
                "Edit Return",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: rollController,
                decoration: const InputDecoration(
                  labelText: "Student Roll",
                  hintText: "Enter your roll number...",
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
                controller: returnDateController,
                decoration: const InputDecoration(
                  labelText: "Return Date",
                  hintText: "dd/mm/yyyy",
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
                          'roll': rollController.text,
                          'code': codeController.text,
                          'dept': selectedDept ?? '',
                          'sem': selectedSem ?? '',
                          'returnDate': returnDateController.text,
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
