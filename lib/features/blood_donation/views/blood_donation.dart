import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';
import '../controllers/blood_donation_controller.dart';

class BloodDonationView extends StatelessWidget {
  final controller = Get.put(BloodDonationController());

  BloodDonationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Blood Donation Center",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // ১. ব্লাড গ্রুপ ফিল্টার বার (Horizontal Scroll)
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.bloodGroups.length + 1,
              itemBuilder: (context, index) {
                String group = index == 0
                    ? "All"
                    : controller.bloodGroups[index - 1];
                return Obx(
                  () => GestureDetector(
                    onTap: () => controller.filterByGroup(group),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: controller.selectedGroup.value == group
                            ? Colors.red
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.red.withOpacity(0.3)),
                      ),
                      child: Center(
                        child: Text(
                          group,
                          style: TextStyle(
                            color: controller.selectedGroup.value == group
                                ? Colors.white
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // ২. ডোনার লিস্ট
          Expanded(
            child: Obx(
              () => controller.filteredDonors.isEmpty
                  ? const Center(child: Text("No Donors Found!"))
                  : ListView.builder(
                      padding: const EdgeInsets.all(15),
                      itemCount: controller.filteredDonors.length,
                      itemBuilder: (context, index) {
                        var donor = controller.filteredDonors[index];
                        return _buildDonorCard(donor);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonorCard(Map<String, String> donor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          // ব্লাড গ্রুপ ব্যাজ
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                donor['group']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),

          // ডোনার ইনফো
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donor['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Dept: ${donor['dept']}",
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),

          // কল বাটন
          IconButton(
            onPressed: () => controller.makeCall(donor['phone']!),
            icon: const Icon(Icons.call, color: Colors.green),
            style: IconButton.styleFrom(
              backgroundColor: Colors.green.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}
