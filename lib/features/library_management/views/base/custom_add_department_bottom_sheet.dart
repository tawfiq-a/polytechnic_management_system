import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class AddDepartmentBottomSheet extends StatefulWidget {
  final Function(Map<String, String>) onAdd;

  const AddDepartmentBottomSheet({super.key, required this.onAdd});

  @override
  State<AddDepartmentBottomSheet> createState() =>
      _AddDepartmentBottomSheetState();
}

class _AddDepartmentBottomSheetState extends State<AddDepartmentBottomSheet> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController shortController = TextEditingController();

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
                "Add Department",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: shortController,
                decoration: const InputDecoration(
                  labelText: "Short Name",
                  hintText: "Enter Short Name",
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
                        widget.onAdd({
                          'name': nameController.text,
                          'short': shortController.text,
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Add Department",
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
