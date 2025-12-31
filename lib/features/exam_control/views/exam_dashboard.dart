import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../controllers/exm_controller.dart';

class DashboardSection extends StatelessWidget {
  final controller = Get.find<ExamController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Upload",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.primary, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                )
              ],
            ),
            child: Obx(
                  () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 45, // কলামের মাঝখানের গ্যাপ ঠিক করা হলো
                  headingRowColor: MaterialStateProperty.all(const Color(0xFFF1F4F6)),
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
                  rows: controller.dashboardList.asMap().entries.map(
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
                                  // যদি কন্ট্রোলারের ড্যাশবোর্ড লিস্টে pdfUrl না থাকে তবে রুটিন লিস্টের মত একটি ডামি লিংক ব্যবহার করা যাবে
                                  // অথবা সরাসরি ফাইল ওপেন হবে
                                  String pdfLink = data['pdfUrl'] ?? "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";
                                  controller.downloadPdf(pdfLink);
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
            ),
          ),
        ],
      ),
    );
  }
}