import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../controllers/exm_controller.dart';

class DashboardSection extends StatelessWidget {
  final controller = Get.find<ExamController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Resent Upload", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.primary, width: 1.5),
            ),
            child: Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 60,
                columns: const [
                  DataColumn(label: Text('No')),
                  DataColumn(label: Text('Title')),
                  DataColumn(label: Text('Publish date')),
                  DataColumn(label: Text('Action')),
                ],
                rows: controller.dashboardList.asMap().entries.map((e) => DataRow(cells: [
                  DataCell(Text(e.value['no']!)),
                  DataCell(Text(e.value['title']!)),
                  DataCell(Text(e.value['date']!)),
                  DataCell(Row(children: [
                    const Icon(Icons.edit_note, color: Colors.grey),
                    const SizedBox(width: 15),
                    GestureDetector(onTap: () => controller.deleteDashboardItem(e.key), child: const Icon(Icons.delete_outline, color: Colors.redAccent)),
                  ])),
                ])).toList(),
              ),
            )),
          ),
        ],
      ),
    );
  }
}