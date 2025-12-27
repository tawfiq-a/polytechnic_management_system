import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/common widgets.dart';
import '../controllers/register_controller.dart';

class InstructorRegisterView extends StatelessWidget {
  final controller = Get.find<RegisterController>();

  InstructorRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            children: [
              buildHeader(
                "Register as a Instructor",
                "(As Per Your Job Registration Card)",
              ),
              const SizedBox(height: 30),

              inputField(
                "Full Name",
                "Atikur Rahman",
                controller.nameController,
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: inputField(
                      "Instructor ID",
                      "6513**",
                      controller.instructorIdController,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: inputField(
                      "Phone",
                      "01707******",
                      controller.phoneController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: inputField(
                      "Department",
                      "Computer Science and Technology",
                      controller.deptController,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: inputField(
                      "Shift",
                      "2nd",
                      controller.shiftController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              inputField(
                "Email",
                "artif****@gmail.com",
                controller.emailController,
              ),
              const SizedBox(height: 15),

              buildPasswordSection(),

              const SizedBox(height: 15),
              buildRememberMe(),

              const SizedBox(height: 25),
              buildCreateButton(),

              const SizedBox(height: 20),
              buildFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
