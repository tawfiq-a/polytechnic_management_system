import 'package:flutter/material.dart';
import 'package:poly_manage_systm/features/register_management/views/show_student_details.dart';

import '../../../core/constants/colors.dart';
import 'add_student_form.dart';

class StudentContent extends StatelessWidget {
  const StudentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Students Application",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 15),

          // Add Student Button
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: () {
                showAddStudentForm();
              },
              icon: const Icon(Icons.add, size: 16, color: Colors.white),
              label: const Text(
                "Add Student",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Main Table Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Search and Filter
                Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      "Students Application",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Filter Button
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.tune, size: 16),
                      label: const Text("Filter"),
                    ),
                    // Search Field
                    SizedBox(
                      width: 200,
                      height: 38,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search Issue...",
                          prefixIcon: const Icon(Icons.search, size: 18),
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _buildFullStudentTable(),
                  ),
                ),

                const SizedBox(height: 15),
                TextButton(onPressed: () {}, child: const Text("View All >")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullStudentTable() {
    return DataTable(
      headingRowColor: MaterialStateProperty.all(Colors.grey.shade50),
      columnSpacing: 30,
      columns: const [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Roll')),
        DataColumn(label: Text('Dept')),
        DataColumn(label: Text('Semester')),
        DataColumn(label: Text('Shift')),
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Action')),
      ],
      rows: List.generate(
        10,
        (index) => DataRow(
          cells: [
            const DataCell(Text('Cheyenne Donin')),
            const DataCell(Text('28545')),
            const DataCell(Text('CST')),
            const DataCell(Text('1st')),
            const DataCell(Text('Day')),
            const DataCell(Text('19 May 25')),
            DataCell(
              _statusBadge(
                index % 3 == 0
                    ? "Approved"
                    : (index % 3 == 1 ? "Pending" : "Cancel"),
              ),
            ),
            DataCell(_actionButton()),
          ],
        ),
      ),
    );
  }

  Widget _actionButton() {
    return ElevatedButton(
      onPressed: () {
        showStudentDetails();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:  AppColors.primary,
        elevation: 0,
      ),
      child: const Text(
        "View Details",
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    );
  }

  Widget _statusBadge(String status) {
    Color color = status == "Approved"
        ? Colors.green
        : (status == "Pending" ? Colors.blue : Colors.red);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
