import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dashboard Overview",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),


            _buildTableCard(title: "Payment Info", table: _paymentTable()),

            const SizedBox(height: 24),

            _buildTableCard(
              title: "Students Application",
              table: _studentTable(),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTableCard({required String title, required Widget table}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF333333),
              ),
            ),
          ),
          const Divider(height: 1),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: table,
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "View All >",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _paymentTable() {
    return DataTable(
      headingTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      dataTextStyle: const TextStyle(fontSize: 13, color: Colors.black54),
      columnSpacing: 40,
      columns: const [
        DataColumn(label: Text('Payment ID')),
        DataColumn(label: Text('User ID')),
        DataColumn(label: Text('Amount')),
        DataColumn(label: Text('Payment Method')),
        DataColumn(label: Text('TxnID')),
        DataColumn(label: Text('Time')),
        DataColumn(label: Text('Action')),
      ],
      rows: List.generate(
        7,
        (index) => DataRow(
          cells: [
            const DataCell(Text('651310')),
            const DataCell(Text('651310')),
            const DataCell(Text('2500TK')),
            const DataCell(Text('Rocket')),
            const DataCell(Text('5685592')),
            const DataCell(Text('10:00 am')),
            DataCell(_actionButton()),
          ],
        ),
      ),
    );
  }


  Widget _studentTable() {
    final List<Map<String, String>> students = [
      {
        "name": "Cheyenne Donin",
        "roll": "28545",
        "dept": "CST",
        "sem": "1st",
        "shift": "Day",
        "date": "19 May 25",
        "status": "Approved",
      },
      {
        "name": "Anika Schleifer",
        "roll": "28545",
        "dept": "CST",
        "sem": "3rd",
        "shift": "Morning",
        "date": "19 May 25",
        "status": "Approved",
      },
      {
        "name": "Tiana Donin",
        "roll": "28545",
        "dept": "CST",
        "sem": "4th",
        "shift": "Day",
        "date": "19 May 25",
        "status": "Pending",
      },
      {
        "name": "Giana Workman",
        "roll": "28545",
        "dept": "CST",
        "sem": "2nd",
        "shift": "Morning",
        "date": "19 May 25",
        "status": "Cancel",
      },
      {
        "name": "Charlie Septimus",
        "roll": "28545",
        "dept": "CST",
        "sem": "CST",
        "shift": "Day",
        "date": "19 May 25",
        "status": "Cancel",
      },
      {
        "name": "Ashlynn Aminoff",
        "roll": "28545",
        "dept": "CST",
        "sem": "CST",
        "shift": "Morning",
        "date": "19 May 25",
        "status": "Pending",
      },
    ];

    return DataTable(
      headingTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      dataTextStyle: const TextStyle(fontSize: 13, color: Colors.black54),
      columnSpacing: 30,
      columns: const [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Roll')),
        DataColumn(label: Text('Department')),
        DataColumn(label: Text('Semester')),
        DataColumn(label: Text('Shift')),
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Action')),
      ],
      rows: students
          .map(
            (s) => DataRow(
              cells: [
                DataCell(Text(s['name']!)),
                DataCell(Text(s['roll']!)),
                DataCell(Text(s['dept']!)),
                DataCell(Text(s['sem']!)),
                DataCell(Text(s['shift']!)),
                DataCell(Text(s['date']!)),
                DataCell(_statusBadge(s['status']!)),
                DataCell(_actionButton()),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget _statusBadge(String status) {
    Color color;
    if (status == "Approved") {
      color = const Color(0xFF2ECC71);
    } else if (status == "Pending") {
      color = const Color(0xFF3498DB);
    } else {
      color = const Color(0xFFE74C3C);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5), width: 0.5),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }


  Widget _actionButton() {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 0,
        ),
        child: const Text("View Details", style: TextStyle(fontSize: 10)),
      ),
    );
  }
}
