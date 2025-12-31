import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../controllers/exm_controller.dart';

class RoutineSection extends StatelessWidget {
  final controller = Get.find<ExamController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Exam Routine",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primary, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                )
              ],
            ),
            child: Obx(
                  () => Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(
                        const Color(0xFFF1F4F6),
                      ),
                      columnSpacing: 40,
                      headingTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14
                      ),
                      columns: const [
                        DataColumn(label: Text('No')),
                        DataColumn(label: Text('Title')),
                        DataColumn(label: Text('Publish date')),
                        DataColumn(label: Text('Action')), // নতুন কলাম
                      ],
                      rows: controller.routineList.asMap().entries.map(
                            (e) {
                          var data = e.value;
                          return DataRow(
                            cells: [
                              DataCell(Text(data['no']!)),
                              DataCell(Text(data['title']!)),
                              DataCell(Text(data['date']!)),
                              DataCell(
                                // ডাউনলোড বাটন ডিজাইন
                                SizedBox(
                                  height: 30,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // কন্ট্রোলার থেকে ডাউনলোড ফাংশন কল
                                      if (data.containsKey('pdfUrl')) {
                                        controller.downloadPdf(data['pdfUrl']!);
                                      } else {
                                        Get.snackbar("Sorry", "PDF file not found!");
                                      }
                                    },
                                    icon: const Icon(Icons.download, size: 14, color: Colors.white),
                                    label: const Text("Download", style: TextStyle(fontSize: 10, color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      elevation: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}