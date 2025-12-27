import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // ১. নেভিগেশন এবং স্টেট লজিক
  var isStudent = true.obs; // true হলে Student, false হলে Instructor
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isRememberMe = false.obs;

  // ২. কমন টেক্সট এডিটিং কন্ট্রোলারস
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final deptController = TextEditingController();
  final shiftController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // ৩. স্টুডেন্ট স্পেসিফিক ফিল্ডস
  final rollController = TextEditingController();
  final regController = TextEditingController();
  final sessionController = TextEditingController();

  // ৪. ইন্সট্রাক্টর স্পেসিফিক ফিল্ডস
  final instructorIdController = TextEditingController();

  // ৫. টগল ফাংশনসমূহ
  void togglePassword() => isPasswordVisible.value = !isPasswordVisible.value;
  void toggleConfirmPassword() => isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  void toggleRememberMe(bool? value) => isRememberMe.value = value ?? false;

  // ৬. ইউজার টাইপ সেট করার ফাংশন
  void setRegistrationType(bool student) {
    isStudent.value = student;
    clearFields(); // টাইপ চেঞ্জ করলে ফিল্ড ক্লিয়ার করা ভালো
  }

  // ৭. সব ফিল্ড ক্লিয়ার করার ফাংশন
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

  // ৮. রেজিস্ট্রেশন সাবমিট করার লজিক
  void registerUser() {
    if (isStudent.value) {
      print("Registering as Student: ${nameController.text}, Roll: ${rollController.text}");
      // এখানে আপনার স্টুডেন্ট রেজিস্ট্রেশন API কল হবে
    } else {
      print("Registering as Instructor: ${nameController.text}, ID: ${instructorIdController.text}");
      // এখানে আপনার ইন্সট্রাক্টর রেজিস্ট্রেশন API কল হবে
    }
  }

  @override
  void onClose() {
    // মেমোরি লিক এড়াতে কন্ট্রোলারগুলো ডিসপোজ করা
    nameController.dispose();
    emailController.dispose();
    // ... বাকি সব ডিসপোজ করুন
    super.onClose();
  }
}