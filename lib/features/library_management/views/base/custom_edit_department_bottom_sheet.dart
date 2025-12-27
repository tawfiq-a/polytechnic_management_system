import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class EditDepartmentBottomSheet extends StatefulWidget {
  final Map<String, String> data;
  final Function(Map<String, String>) onUpdate;

  const EditDepartmentBottomSheet({super.key, required this.data, required this.onUpdate});

  @override
  State<EditDepartmentBottomSheet> createState() => _EditDepartmentBottomSheetState();
}

class _EditDepartmentBottomSheetState extends State<EditDepartmentBottomSheet> {
  late TextEditingController nameController;
  late TextEditingController shortController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.data['name']);
    shortController = TextEditingController(text: widget.data['short']);
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
                  const Text("Edit Department", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextField(controller: nameController, decoration: const InputDecoration(labelText: "Name", hintText: "Enter Department Name", border: OutlineInputBorder())),
              const SizedBox(height: 12),
              TextField(controller: shortController, decoration: const InputDecoration(labelText: "Short Name", hintText: "Enter Department Short Name", border: OutlineInputBorder())),
              const SizedBox(height: 20),
              Row(
                  children: [
              Expanded(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white), onPressed: () => Navigator.pop(context), child: const Text("Cancel",style: TextStyle(color: Colors.black),))),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                        onPressed: () {
                          widget.onUpdate({
                            'name': nameController.text,
                            'short': shortController.text,
                          });
                          Navigator.pop(context);
                        },
                        child: const Text("Update",style: TextStyle(color: Colors.white),),
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
