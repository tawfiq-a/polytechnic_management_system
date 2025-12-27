import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final summaryData = [
      {'title': 'Total Books', 'count': '1025'},
      {'title': 'Total Students', 'count': '6000'},
      {'title': 'Issued Books', 'count': '800'},
      {'title': 'Overdue Books', 'count': '400'},
    ];

    final studentData = [
      {'roll': '651221', 'return': '19 May 25', 'fine': '40', 'status': 'Issued'},
      {'roll': '651222', 'return': '19 May 25', 'fine': '40', 'status': 'Issued'},
      {'roll': '651223', 'return': '19 May 25', 'fine': '40', 'status': 'Overdue'},
      {'roll': '651224', 'return': '19 May 25', 'fine': '20', 'status': 'Return'},
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // 2x2 Grid Summary Cards
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: summaryData.map((item) {
                return Card(
                  color: Colors.amber.shade100,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item['count']!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text(item['title']!, style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Student Activity List
            Expanded(
              child: ListView.builder(
                itemCount: studentData.length,
                itemBuilder: (context, index) {
                  final student = studentData[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(child: Text(student['roll']!.substring(4))),
                      title: Text('Roll: ${student['roll']}'),
                      subtitle: Text('Return: ${student['return']} • Fine: \$${student['fine']}'),
                      trailing: Text(student['status']!, style: TextStyle(
                        color: student['status'] == 'Overdue' ? Colors.red : Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

