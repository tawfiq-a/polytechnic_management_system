import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  var isStudent = true.obs;
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isRememberMe = false.obs;


  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final deptController = TextEditingController();
  final shiftController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  final rollController = TextEditingController();
  final regController = TextEditingController();
  final sessionController = TextEditingController();


  final instructorIdController = TextEditingController();

  void togglePassword() => isPasswordVisible.value = !isPasswordVisible.value;
  void toggleConfirmPassword() =>
      isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  void toggleRememberMe(bool? value) => isRememberMe.value = value ?? false;


  void setRegistrationType(bool student) {
    isStudent.value = student;
    clearFields();
  }


  void clearFields() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    deptController.clear();
    shiftController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    rollController.clear();
    regController.clear();
    sessionController.clear();
    instructorIdController.clear();
  }


  void registerUser() {
    if (isStudent.value) {
      print(
        "Registering as Student: ${nameController.text}, Roll: ${rollController.text}",
      );

    } else {
      print(
        "Registering as Instructor: ${nameController.text}, ID: ${instructorIdController.text}",
      );

    }
  }

  @override
  void onClose() {

    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
