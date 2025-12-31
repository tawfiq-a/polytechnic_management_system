import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../controllers/exm_controller.dart';

class SeatPlan extends StatelessWidget {
  final controller = Get.find<ExamController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Seat Plan",
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
                ),
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
                      ),
                      columns: const [
                        DataColumn(label: Text('No')),
                        DataColumn(label: Text('Title')),
                        DataColumn(label: Text('Publish date')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: controller.routineList.asMap().entries.map((e) {
                        var data = e.value;
                        return DataRow(
                          cells: [
                            DataCell(Text(data['no']!)),
                            DataCell(Text(data['title']!)),
                            DataCell(Text(data['date']!)),
                            DataCell(
                              ElevatedButton.icon(
                                onPressed: () {
                                  if (data.containsKey('pdfUrl')) {
                                    controller.downloadPdf(data['pdfUrl']!);
                                  } else {
                                    Get.snackbar(
                                      "Sorry",
                                      "PDF not available for this item",
                                    );
                                  }
                                },
                                icon: const Icon(
                                  Icons.picture_as_pdf,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "PDF",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  minimumSize: const Size(60, 28),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  elevation: 0,
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
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
