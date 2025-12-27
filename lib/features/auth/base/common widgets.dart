import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/register_controller.dart';
import '../views/sign_in.dart';

extension CommonWidgets on StatelessWidget {
  // হেডার ডিজাইন
  Widget buildHeader(String title, String subtitle) {
    return Column(
      children: [
        const Text(
          "Registration",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF003D4D),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget inputField(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ],
    );
  }

  // পাসওয়ার্ড সেকশন (উভয় ভিউতে এক)
  Widget buildPasswordSection() {
    final controller = Get.find<RegisterController>();
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => passwordField(
              "Password",
              controller.passwordController,
              controller.isPasswordVisible.value,
              controller.togglePassword,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Obx(
            () => passwordField(
              "Confirm Password",
              controller.confirmPasswordController,
              controller.isConfirmPasswordVisible.value,
              controller.toggleConfirmPassword,
            ),
          ),
        ),
      ],
    );
  }

  Widget passwordField(
    String label,
    TextEditingController controller,
    bool isVisible,
    VoidCallback onToggle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: !isVisible,
          decoration: InputDecoration(
            hintText: "••••••••",
            suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                size: 18,
              ),
              onPressed: onToggle,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  // রিমেম্বার মি
  Widget buildRememberMe() {
    final controller = Get.find<RegisterController>();
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: controller.isRememberMe.value,
            onChanged: controller.toggleRememberMe,
            activeColor: const Color(0xFF003D4D),
          ),
        ),
        const Text("Remember me", style: TextStyle(fontSize: 13)),
      ],
    );
  }

  // ক্রিয়েট বাটন
  Widget buildCreateButton() {
    final controller = Get.find<RegisterController>();
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: controller.registerUser,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF003D4D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          "Create Account",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // ফুটার
  Widget buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account? "),
        GestureDetector(
          onTap: () => Get.to(() => LoginView()),
          child: const Text(
            "Sign In",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
