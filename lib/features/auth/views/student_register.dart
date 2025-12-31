import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/common widgets.dart';
import '../controllers/register_controller.dart';

class StudentRegisterView extends StatelessWidget {
  final controller = Get.put(RegisterController());


  StudentRegisterView({super.key});

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
                "Register to as a Student",
                "(As Per Your Registration Card)",
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
                      "Roll",
                      "6513**",
                      controller.rollController,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: inputField(
                      "Registration:",
                      "1502200***",
                      controller.regController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              inputField(
                "Department",
                "Computer Science and Technology",
                controller.deptController,
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: inputField(
                      "Shift",
                      "2nd",
                      controller.shiftController,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: inputField(
                      "Session",
                      "21-22",
                      controller.sessionController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: inputField(
                      "Phone Number",
                      "01707******",
                      controller.phoneController,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: inputField(
                      "Email",
                      "artif****@gmail.com",
                      controller.emailController,
                    ),
                  ),
                ],
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
