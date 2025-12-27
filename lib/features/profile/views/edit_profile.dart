import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends StatelessWidget {
  final controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text(
          "Student Profile Info",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUploadZone(),
            const SizedBox(height: 20),

            _buildImagePreview(),
            const SizedBox(height: 30),

            _buildInputLabel("Full Name"),
            _buildTextField("Enter your name"),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputLabel("Roll"),
                      _buildTextField("Enter your Roll"),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputLabel("Registration:"),
                      _buildTextField("Enter your Reg. No"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildInputLabel("Department"),
            _buildTextField("Enter Department"),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputLabel("Shift"),
                      _buildTextField("Enter Shift"),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputLabel("Session"),
                      _buildTextField("Enter Session"),
                    ],
                  ),
                ),
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
                      _buildTextField("+880 ****"),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputLabel("Email"),
                      _buildTextField("Enter email"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildActionButton(
                  "Cancel",
                  isOutlined: true,
                  onTap: () => Get.back(),
                ),
                const SizedBox(width: 15),
                _buildActionButton("Update", onTap: () {}),
              ],
            ),

            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 20),


            const Text(
              "Change password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003D4D),
              ),
            ),
            const SizedBox(height: 20),

            _buildInputLabel("Old Password"),
            _buildPasswordField(
              "••••••",
              controller.isOldPassVisible,
              controller.toggleOldPass,
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputLabel("New password"),
                      _buildPasswordField(
                        "••••••",
                        controller.isNewPassVisible,
                        controller.toggleNewPass,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputLabel("Confirm Password"),
                      _buildPasswordField(
                        "••••••",
                        controller.isConfirmPassVisible,
                        controller.toggleConfirmPass,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ৬. চেঞ্জ ও ক্যান্সেল বাটন
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(
                  "Cancel",
                  isOutlined: true,
                  onTap: () => Get.back(),
                ),
                const SizedBox(width: 15),
                _buildActionButton("Change", onTap: () {}),
              ],
            ),
            const SizedBox(height: 50),
          ],
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

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
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
    );
  }

  Widget _buildPasswordField(
    String hint,
    RxBool visibility,
    VoidCallback onToggle,
  ) {
    return Obx(
      () => TextField(
        obscureText: !visibility.value,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: IconButton(
            icon: Icon(
              visibility.value ? Icons.visibility : Icons.visibility_off,
              size: 18,
              color: Colors.grey,
            ),
            onPressed: onToggle,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadZone() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Icon(Icons.cloud_upload_outlined, size: 45, color: Colors.grey),
          const Text(
            "Drop file or browse",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "Format: .jpeg, .png & Max file size: 25 MB",
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => controller.pickProfileImage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003D4D),
            ),
            child: const Text(
              "Browse Files",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: NetworkImage('https://i.pravatar.cc/150?u=9'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.close, color: Colors.white, size: 14),
          ),
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
      height: 40,
      width: 120,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.white : const Color(0xFF003D4D),
          side: isOutlined
              ? const BorderSide(color: Colors.redAccent)
              : BorderSide.none,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isOutlined ? Colors.redAccent : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
