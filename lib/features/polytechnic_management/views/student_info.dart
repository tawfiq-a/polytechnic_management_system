import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/features/polytechnic_management/views/student_profile_view.dart';
import '../controllers/student_controller.dart';

class StudentInfoView extends StatelessWidget {
  // কন্ট্রোলার খুঁজে বের করা
  final controller = Get.put(StudentTableController());

  StudentInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      body: Column(
        children: [
          _buildSearchBar(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: _buildStudentTableCard(),
            ),
          ),

          _buildPagination(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return const Padding(
      padding: EdgeInsets.only(right: 15),
      child: Row(
        children: [
          CircleAvatar(radius: 15, backgroundColor: Colors.grey),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tanvir",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
              Text(
                "Section Admin",
                style: TextStyle(color: Colors.grey, fontSize: 9),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 300,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search student name or roll...",
              hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
              prefixIcon: const Icon(
                Icons.search,
                size: 18,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ৩. টেবিল কার্ড ফাংশন
  Widget _buildStudentTableCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(const Color(0xFFF1F4F6)),
          columnSpacing: 25,
          headingTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 13,
          ),
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Roll')),
            DataColumn(label: Text('Department')),
            DataColumn(label: Text('Shift')),
            DataColumn(label: Text('Session')),
            DataColumn(label: Text('Phone')),
            DataColumn(label: Text('Action')),
          ],
          rows: controller.studentList
              .map(
                (s) => DataRow(
                  cells: [
                    DataCell(Text(s['name']!)),
                    DataCell(Text(s['roll']!)),
                    DataCell(Text(s['dept']!)),
                    DataCell(Text(s['shift']!)),
                    DataCell(Text(s['session']!)),
                    DataCell(Text(s['phone']!)),
                    DataCell(_viewDetailsButton()),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  // ৪. ভিউ বাটন ফাংশন
  Widget _viewDetailsButton() {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => StudentProfileView());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF003D4D),
        minimumSize: const Size(80, 28),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: const Text(
        "View Details",
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }


  Widget _buildPagination() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(Icons.chevron_left, color: Colors.grey, size: 20),
          const SizedBox(width: 10),
          _pageBox("1", isSelected: true),
          _pageBox("2"),
          _pageBox("3"),
          _pageBox("4"),
          _pageBox("5"),
          const SizedBox(width: 15),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _pageBox(String num, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF003D4D) : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        num,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }
}
