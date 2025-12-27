import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class EditBookBottomSheet extends StatefulWidget {
  final Map<String, String> book;
  final Function(Map<String, String>) onUpdate;

  const EditBookBottomSheet({super.key, required this.book, required this.onUpdate});

  @override
  State<EditBookBottomSheet> createState() => _EditBookBottomSheetState();
}

class _EditBookBottomSheetState extends State<EditBookBottomSheet> {
  late TextEditingController titleController;
  late TextEditingController codeController;
  late TextEditingController copiesController;
  String? selectedDept;
  String? selectedSem;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.book['title']);
    codeController = TextEditingController(text: widget.book['code']);
    copiesController = TextEditingController(text: widget.book['copies']);
    selectedDept = widget.book['dept'];
    selectedSem = widget.book['sem'];
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
              const Text("Edit Book", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                  labelText: "S-Code",
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
                items: ['CST', 'ET', 'ENT', 'RAC', 'EMT']
                    .map((dept) => DropdownMenuItem(value: dept, child: Text(dept)))
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
                    .map((sem) => DropdownMenuItem(value: sem, child: Text(sem)))
                    .toList(),
                onChanged: (value) => setState(() => selectedSem = value),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: copiesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Copies",
                  hintText: "Enter your book copies",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel",style: TextStyle(color: Colors.black),),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                      onPressed: () {
                        widget.onUpdate({
                          'title': titleController.text,
                          'code': codeController.text,
                          'copies': copiesController.text,
                          'dept': selectedDept ?? '',
                          'sem': selectedSem ?? '',
                        });
                        Navigator.pop(context);
                      },
                      child: const Text("Edit Book",style: TextStyle(color: Colors.white),),
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
