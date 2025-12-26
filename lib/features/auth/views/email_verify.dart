import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // হালকা ব্যাকগ্রাউন্ড কালার
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ১. স্ক্রিন টাইটেল
              const Text(
                "Email Verification",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003D4D), // আপনার থিম নেভি ব্লু কালার
                ),
              ),
              const SizedBox(height: 30),

              // ২. ওটিপি কার্ড সেকশন
              Container(
                width: 450, // ওয়েব বা ট্যাবলেটের জন্য উইডথ
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ৩. ওটিপি লেবেল
                    const Text(
                      "OTP",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ৪. ওটিপি ইনপুট ফিল্ড
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      obscureText: true, // পাসওয়ার্ডের মত ডট দেখানোর জন্য
                      obscuringCharacter: '•',
                      decoration: InputDecoration(
                        hintText: "••••••",
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            letterSpacing: 5
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFF003D4D)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ৫. কন্টিনিউ বাটন
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {

                          Get.toNamed(AppRoutes.setNewPass);
                          Get.snackbar("Success", "Email Verified Successfully!");
                          // Get.toNamed('/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF003D4D), // থিম কালার
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              // নিচে চাইলে "Resend Code" অপশন যোগ করতে পারেন
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Didn't receive a code? Resend",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}