import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstructorProfileController extends GetxController {
  var isEditMode = false.obs;

  final nameController = TextEditingController(text: "Mir Tawfiq Al Sayem");
  final rollController = TextEditingController(text: "6513**");
  final regController = TextEditingController(text: "1502200***");
  final deptController = TextEditingController(
    text: "Computer Science and Technology",
  );
  final shiftController = TextEditingController(text: "2nd");
  final sessionController = TextEditingController(text: "21-22");
  final phoneController = TextEditingController(text: "01707******");
  final emailController = TextEditingController(text: "artif****@gmail.com");

  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;
  }

  void updateProfile() {
    isEditMode.value = false;
    Get.snackbar(
      "Success",
      "Profile Updated Successfully",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
