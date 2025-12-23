import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showPaymentDetailsBottomSheet() {
  Get.bottomSheet(
    isScrollControlled: true,
    Container(
      height: Get.height * 0.85, // স্ক্রিনের ৮৫% জায়গা নেবে
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
          // হেডার: Title এবং Close Icon
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Payment Details",
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

          // ফর্ম কন্টেন্ট (Scrollable)
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),

                  // ১. Payment Info Section
                  _sectionHeader("Payment Info"),
                  _buildTwoColumnRow(
                    _infoField("Payment ID", "123456789"),
                    _infoField("User ID", "651317"),
                  ),
                  _buildTwoColumnRow(
                    _infoField("User Name", "Name"),
                    _infoField("User Phone", "017*********"),
                  ),

                  const SizedBox(height: 20),

                  // ২. Payment Details Section
                  _sectionHeader("Payment Details"),
                  _buildTwoColumnRow(
                    _infoField("Amount", "2500"),
                    _infoField("Payment Method", "Rocket"),
                  ),

                  const SizedBox(height: 20),

                  // ৩. Transaction Proof Section
                  _sectionHeader("Transaction Proof"),
                  _buildTwoColumnRow(
                    _infoField("Transaction Id", "12345687986"),
                    _infoField("Sender Phone", "017***********"),
                  ),
                  _buildTwoColumnRow(
                    _infoField("Transaction Time", "7:49 PM"),
                    _infoField("Transaction Date", "22/Dec/2025"),
                  ),

                  const SizedBox(height: 30),

                  // ডাউনলোড বাটন (Bottom Left)
                  SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // ডাউনলোড লজিক এখানে হবে
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF003D4D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        "Download Info",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// সেকশন টাইটেল উইজেট
Widget _sectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0078AA), // আপনার ইমেজের ব্লু কালার
      ),
    ),
  );
}

// ইনপুট ফিল্ড উইজেট (Read Only Style)
Widget _infoField(String label, String value) {
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
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          value,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    ],
  );
}

// ২ কলামের রো উইজেট
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