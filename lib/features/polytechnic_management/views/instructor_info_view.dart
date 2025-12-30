import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/instructor_controller.dart';
import 'instructor_profile_view.dart';


class InstructorInfoView extends StatelessWidget {

  final controller = Get.put(InstructorTableController());

  InstructorInfoView({super.key});

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
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Department')),
            DataColumn(label: Text('Shift')),
            DataColumn(label: Text('Email')),
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


  Widget _viewDetailsButton() {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => InstructorProfileView());
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
