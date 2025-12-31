import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isRememberMe = false.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final deptController = TextEditingController();
  final shiftController = TextEditingController();
  final rollController = TextEditingController();
  final regController = TextEditingController();
  final sessionController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void togglePassword() => isPasswordVisible.value = !isPasswordVisible.value;
  void toggleConfirmPassword() =>
      isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  void toggleRememberMe(bool? value) => isRememberMe.value = value ?? false;

  void registerUser() {
    if (nameController.text.isNotEmpty && rollController.text.isNotEmpty) {
      print(
        "Registering Student: ${nameController.text}, Roll: ${rollController.text}",
      );
    } else {
      Get.snackbar(
        "Error",
        "Please fill all required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    deptController.dispose();
    shiftController.dispose();
    rollController.dispose();
    regController.dispose();
    sessionController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
