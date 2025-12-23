import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/exm_controller.dart';

class SeatPlan extends StatelessWidget {
  final controller = Get.find<ExamController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Manage Seat Plan", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.cloud_upload_outlined,
                  size: 50,
                  color: Colors.grey,
                ),
                const Text(
                  "Drop file or browse",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  child: const Text(
                    "Browse Files",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // টেবিল
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
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
                      columns: const [
                        DataColumn(label: Text('No')),
                        DataColumn(label: Text('Title')),
                        DataColumn(label: Text('Publish date')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: controller.routineList
                          .asMap()
                          .entries
                          .map(
                            (e) => DataRow(
                          cells: [
                            DataCell(Text(e.value['no']!)),
                            DataCell(Text(e.value['title']!)),
                            DataCell(Text(e.value['date']!)),
                            DataCell(
                              Row(
                                children: [
                                  const Icon(
                                    Icons.edit_note,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () =>
                                        controller.deleteRoutineItem(e.key),
                                    child: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                          .toList(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.chevron_left),
                        Text(" 1  2  3 "),
                        Icon(Icons.chevron_right),
                      ],
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
