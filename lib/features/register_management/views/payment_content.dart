import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMakePaymentBottomSheet() {
  Get.bottomSheet(
    isScrollControlled: true,
    Container(
      height: Get.height * 0.75,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Make New Payment",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003D4D),
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close, color: Colors.red, size: 28),
                ),
              ],
            ),
          ),
          const Divider(),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  _sectionHeader("Student Details"),
                  _buildTwoColumnRow(
                    _paymentInputField("Student Name", "Enter student name"),
                    _paymentInputField("Student Roll", "Enter student Roll"),
                  ),
                  SizedBox(height: 10),
                  _buildTwoColumnRow(
                    _paymentInputField(
                      "Registration number",
                      "Enter Registration Number",
                    ),
                    _paymentInputField(
                      "Session",
                      "2021-2022",
                    ),


                  ),
                  _semesterDropdownField("Semester"),

                  const SizedBox(height: 10),
                  _buildTwoColumnRow(
                    _paymentInputField("Department", "Enter Department"),
                    _paymentInputField("Shift", "Enter shift"),
                  ),

                  _sectionHeader("Payment Details"),
                  _buildTwoColumnRow(
                    _paymentInputField("Amount", "Enter amount (e.g. 2500)"),
                    _paymentDropdownField("Payment Method"),
                  ),

                  const SizedBox(height: 20),

                  _sectionHeader("Transaction Information"),
                  _buildTwoColumnRow(
                    _paymentInputField("Transaction Id", "Enter Txn ID"),
                    _paymentInputField("Sender Phone", "01*********"),
                  ),

                  const SizedBox(height: 10),
                  const Text(
                    "* Please make sure you have already sent the money to our official number before submitting.",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.redAccent,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.snackbar(
                          "Success",
                          "Payment submitted for review!",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF003D4D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Submit Payment",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _sectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0078AA),
      ),
    ),
  );
}

Widget _buildTwoColumnRow(Widget left, Widget right) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Row(
      children: [
        Expanded(child: left),
        const SizedBox(width: 20),
        Expanded(child: right),
      ],
    ),
  );
}

Widget _paymentInputField(String label, String hint) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
        ),
      ),
      const SizedBox(height: 8),
      TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
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
      ),
    ],
  );
}

Widget _paymentDropdownField(String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text("Select Method", style: TextStyle(fontSize: 12)),
            items: ["Bkash", "Nagad", "Rocket"].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(fontSize: 13)),
              );
            }).toList(),
            onChanged: (val) {},
          ),
        ),
      ),
    ],
  );
}

Widget _semesterDropdownField(String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text("Select Semester", style: TextStyle(fontSize: 12)),
            items:
                [
                  "Refard or Drop",
                  "1st Semester",
                  "2nd Semester",
                  "3rd Semester",
                  "4th Semester",
                  "5th Semester",
                  "6th Semester",
                  "7th Semester",
                  "8th Semester",
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontSize: 13)),
                  );
                }).toList(),
            onChanged: (val) {},
          ),
        ),
      ),
    ],
  );
}
