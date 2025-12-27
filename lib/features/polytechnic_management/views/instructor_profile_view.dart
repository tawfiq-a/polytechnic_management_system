import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/instructor_profile_controller.dart';
import '../controllers/student_profile_controller.dart';

class InstructorProfileView extends StatelessWidget {
  final controller = Get.put(InstructorProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Instructor Profile Info",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003D4D),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close, color: Colors.redAccent),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              _buildAvatar(),
              const SizedBox(height: 30),

              _buildInputLabel("Full Name"),
              _buildTextField(controller.nameController),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInputLabel("Instructor ID"),
                        _buildTextField(controller.rollController),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 20),

              _buildInputLabel("Department"),
              _buildTextField(controller.deptController),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInputLabel("Shift"),
                        _buildTextField(controller.shiftController),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInputLabel("Phone Number"),
                        _buildTextField(controller.phoneController),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInputLabel("Email"),
                        _buildTextField(controller.emailController),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // ৪. অ্যাকশন বাটনসমূহ (Obx দিয়ে ডাইনামিক করা হয়েছে)
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // বাম পাশের বাটন (Delete / Cancel)
                    _buildActionButton(
                      controller.isEditMode.value ? "Cancel" : "Delete",
                      isOutlined: true,
                      onTap: () {
                        if (controller.isEditMode.value) {
                          controller.toggleEditMode();
                        } else {
                          // ডিলিট লজিক
                        }
                      },
                    ),
                    const SizedBox(width: 20),
                    // ডান পাশের বাটন (Edit / Update)
                    _buildActionButton(
                      controller.isEditMode.value ? "Update" : "Edit",
                      onTap: () {
                        if (controller.isEditMode.value) {
                          controller.updateProfile();
                        } else {
                          controller.toggleEditMode();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- হেল্পার উইজেটসমূহ ---

  Widget _buildAvatar() {
    return Container(
      height: 80,
      width: 80,
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage('https://i.pravatar.cc/150?u=10'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController textCtrl) {
    return Obx(
      () => TextField(
        controller: textCtrl,
        enabled: controller.isEditMode.value,
        decoration: InputDecoration(
          filled: !controller.isEditMode.value,
          fillColor: Colors.grey.shade50,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 12,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
        style: TextStyle(
          color: controller.isEditMode.value ? Colors.black : Colors.grey,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildActionButton(
    String label, {
    bool isOutlined = false,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 140,
      height: 45,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.white : const Color(0xFF003D4D),
          side: isOutlined
              ? const BorderSide(color: Colors.grey, width: 0.5)
              : BorderSide.none,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isOutlined ? Colors.redAccent : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
