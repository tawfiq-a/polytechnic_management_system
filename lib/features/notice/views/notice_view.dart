import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';
import '../controllers/notice_controller.dart';

class AllNoticesView extends StatelessWidget {
  final controller = Get.put(NoticeController());

  AllNoticesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All Notices",
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Container(
              height: 3,
              width: 40,
              color: Colors.lightBlue[200],
            ),
          ],
        ),
        actions: [_buildFilterMenu()],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                itemCount: controller.notices.length,
                itemBuilder: (context, index) {
                  return _buildNoticeCard(controller.notices[index]);
                },
              ),
            ),
          ),
          // পেজিনেশন সেকশন
          _buildPagination(),
        ],
      ),
    );
  }


  Widget _buildFilterMenu() {
    return PopupMenuButton<String>(
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: const [
            Text(
              "Filter  ",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            Icon(Icons.tune, size: 16, color: Colors.black),
          ],
        ),
      ),
      onSelected: controller.changeFilter,
      itemBuilder: (context) => [
        const PopupMenuItem(value: "Exam", child: Text("Exam Notices")),
        const PopupMenuItem(
          value: "Important",
          child: Text("Important Notices"),
        ),
        const PopupMenuItem(value: "Academic", child: Text("Academic Notices")),
      ],
    );
  }


  Widget _buildNoticeCard(Map<String, String> notice) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5),
        ],
      ),
      child: Row(
        children: [

          Text(
            notice['date']!,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 10),
          const Text("|", style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 10),


          Expanded(
            child: Text(
              notice['title']!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),


          const SizedBox(width: 5),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download, size: 14, color: Colors.white),
            label: const Text(
              "Download",
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003D4D),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: const Size(60, 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildPagination() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.chevron_left, color: Colors.grey, size: 18),
          const SizedBox(width: 10),
          _pageItem("1", isSelected: true),
          _pageItem("2"),
          _pageItem("3"),
          _pageItem("4"),
          _pageItem("5"),
          const SizedBox(width: 10),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
        ],
      ),
    );
  }

  Widget _pageItem(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF003D4D) : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontSize: 12,
        ),
      ),
    );
  }
}
