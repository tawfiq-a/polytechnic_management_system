import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/routes/app_routes.dart';

import '../controllers/register_controller.dart';

class RegisterSelectView extends StatelessWidget {
  RegisterSelectView({super.key});
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Register as a",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _selectionButton("Student", () {
                    controller.setRegistrationType(true);
                    Get.toNamed(AppRoutes.studentRegister);
                  }),
                  const SizedBox(width: 20),

                  _selectionButton("Instructor", () {
                    controller.setRegistrationType(false);
                    Get.toNamed(AppRoutes.instructorRegister);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectionButton(String label, VoidCallback onTap) {
    return SizedBox(
      width: 130,
      height: 65,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF003D4D),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
