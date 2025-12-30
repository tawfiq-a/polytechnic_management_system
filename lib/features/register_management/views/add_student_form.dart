import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';

import '../controllers/dashboard_controller.dart';

void showAddStudentForm() {
  final AppController controller = Get.find<AppController>();

  Get.bottomSheet(
    Container(
      height: Get.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Students Application Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003D4D),
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close, color: Colors.red),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Application Info"),
                  _buildThreeColumnRow([
                    _inputField("Department", "CST"),
                    _inputField("Shift", "Day"),
                    _inputField("Semester", "1st"),
                  ]),
                  _buildThreeColumnRow([
                    _inputField("Date", "20/12/2025"),
                    _inputField("Phone", "017*********"),
                    _inputField("Email", "email@*********"),
                  ]),

                  const SizedBox(height: 20),
                  _sectionTitle("Personal Info"),
                  _buildThreeColumnRow([
                    _inputField("Name", "Name"),
                    _inputField("Father's name", "Father's name"),
                    _inputField("Mother's name", "Mother's name"),
                  ]),
                  _buildThreeColumnRow([
                    _inputField("Phone number", "017*********"),
                    _inputField("Address (Present)", "Dhaka"),
                    _inputField("Address (Permanent)", "Dhaka"),
                  ]),
                  _buildThreeColumnRow([
                    _inputField("Nationality", "Bangladeshi"),
                    _inputField("Date of birth", "24/01/2004"),
                    _inputField("Religion", "Islam"),
                  ]),

                  const SizedBox(height: 20),
                  _sectionTitle("Academic Info"),
                  _buildThreeColumnRow([
                    _inputField("SSC/HSC Roll", "123456"),
                    _inputField("SSC/HSC Registration No.", "1234567890"),
                    _inputField("Board", "Dhaka"),
                  ]),
                  _buildThreeColumnRow([
                    _inputField("Group", "Science"),
                    _inputField("GPA", "GPA 5"),
                    _inputField("School/College Name", "Dhaka school"),
                  ]),
                  _inputField("Passing year", "2023", width: Get.width * 0.3),

                  const SizedBox(height: 30),
                  _sectionTitle("Uploaded Documents"),
                  _uploadBox(controller),
                  const SizedBox(height: 15),
                  _documentItem("SSC Certificate"),
                  _documentItem("Birth Certificate"),
                  _documentItem("NID"),

                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _statusDropdown(controller),
                      ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                        ),
                        child: const Text(
                          "Add Info",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}



Widget _sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    ),
  );
}

Widget _buildThreeColumnRow(List<Widget> children) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: children
          .map(
            (e) => Expanded(
              child: Padding(padding: const EdgeInsets.all(4), child: e),
            ),
          )
          .toList(),
    ),
  );
}

Widget _inputField(String label, String hint, {double? width}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 5),
      SizedBox(
        width: width,
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _uploadBox(AppController controller) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        const Icon(Icons.cloud_upload_outlined, size: 40, color: Colors.grey),
        const Text(
          "Drop file or browse",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Obx(
          () => Text(
            controller.selectedFileName.value.isEmpty
                ? "Format: .jpeg, .png, PDF & Max file size: 25 MB"
                : "Selected: ${controller.selectedFileName.value}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: controller.selectedFileName.value.isEmpty
                  ? Colors.grey
                  : Colors.green,
              fontWeight: controller.selectedFileName.value.isEmpty
                  ? FontWeight.normal
                  : FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () => controller.pickFile(),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          child: const Text(
            "Browse Files",
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ],
    ),
  );
}

Widget _documentItem(String title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 13)),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: const Size(80, 30),
          ),
          child: const Text(
            "Download",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

Widget _statusDropdown(AppController controller) {
  return Obx(
    () => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        value: controller.selectedStatus.value,
        underline: Container(),
        items: ["Approved", "Pending", "Cancel"]
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e, style: const TextStyle(fontSize: 12)),
              ),
            )
            .toList(),
        onChanged: (val) {
          if (val != null) {
            controller.selectedStatus.value = val;
          }
        },
      ),
    ),
  );
}
