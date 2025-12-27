import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class AddReturnBottomSheet extends StatefulWidget {
  final Function(Map<String, String>) onAdd;

  const AddReturnBottomSheet({super.key, required this.onAdd});

  @override
  State<AddReturnBottomSheet> createState() => _AddReturnBottomSheetState();
}

class _AddReturnBottomSheetState extends State<AddReturnBottomSheet> {
  final TextEditingController rollController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();
  String? selectedDept;
  String? selectedSem;

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
              const Text("Add Return", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextField(controller: rollController, decoration: const InputDecoration(labelText: "Student Roll", hintText: "Enter a student roll no...", border: OutlineInputBorder())),
              const SizedBox(height: 12),
              TextField(controller: codeController, decoration: const InputDecoration(labelText: "Subject Code", hintText: "Enter your book Subject code", border: OutlineInputBorder())),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedDept,
                decoration: const InputDecoration(labelText: "Department", hintText: "Select department", border: OutlineInputBorder()),
                items: ['CST','ET','ENT','RAC','EMT','Computer'].map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
                onChanged: (v) => setState(() => selectedDept = v),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedSem,
                decoration: const InputDecoration(labelText: "Semester", hintText: "Select semester", border: OutlineInputBorder()),
                items: ['1st','2nd','3rd','4th','5th','6th','7th','8th'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                onChanged: (v) => setState(() => selectedSem = v),
              ),
              const SizedBox(height: 12),
              TextField(controller: returnDateController, decoration: const InputDecoration(labelText: "Return Date", hintText: "dd/mm/yyyy", border: OutlineInputBorder())),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white), onPressed: () => Navigator.pop(context), child: const Text("Cancel",style: TextStyle(color: Colors.black),))),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                      onPressed: () {
                        widget.onAdd({
                          'roll': rollController.text,
                          'code': codeController.text,
                          'dept': selectedDept ?? '',
                          'sem': selectedSem ?? '',
                          'returnDate': returnDateController.text,
                        });
                        Navigator.pop(context);
                      },
                      child: const Text("Add Issue",style: TextStyle(color: Colors.white),),
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
