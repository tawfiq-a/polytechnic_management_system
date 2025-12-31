import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';
import '../controllers/attendance_controller.dart';

class AttendanceView extends StatelessWidget {
  final controller = Get.put(AttendanceController());

  AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Attendance",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Attendance Summary",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Obx(
                  () => Text(
                    controller.reportPeriod.value,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            _buildChartSection(),
            const SizedBox(height: 30),
            _buildStatCards(),
            const SizedBox(height: 35),

            const Text(
              "Monthly History",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003D4D),
              ),
            ),
            const SizedBox(height: 15),
            _buildHistoryList(),
          ],
        ),
      ),
    );
  }

  Widget _buildChartSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 110,
            width: 110,
            child: Obx(
              () => PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 35,
                  sections: [
                    PieChartSectionData(
                      value: controller.presentDays.value.toDouble(),
                      color: Colors.green,
                      radius: 12,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: controller.absentDays.value.toDouble(),
                      color: Colors.red,
                      radius: 18,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: controller.lateDays.value.toDouble(),
                      color: Colors.orange,
                      radius: 12,
                      showTitle: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    "${controller.attendancePercentage.toStringAsFixed(1)}%",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003D4D),
                    ),
                  ),
                ),
                const Text(
                  "Total Presence",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),

                Obx(
                  () => Text(
                    "Period: ${controller.reportPeriod.value}",
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _miniCard(
          "Present",
          controller.presentDays.value.toString(),
          Colors.green,
        ),
        _miniCard("Absent", controller.absentDays.value.toString(), Colors.red),
        _miniCard("Late", controller.lateDays.value.toString(), Colors.orange),
      ],
    );
  }

  Widget _miniCard(String title, String value, Color color) {
    return Container(
      width: Get.width * 0.28,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border(bottom: BorderSide(color: color, width: 4)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryList() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.attendanceHistory.length,
        itemBuilder: (context, index) {
          var data = controller.attendanceHistory[index];
          Color statusColor = data['status'] == "Present"
              ? Colors.green
              : (data['status'] == "Late" ? Colors.orange : Colors.red);

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['date']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        data['day']!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    const Text(
                      "Check-in",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Text(
                      data['time']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: data['status'] == "Absent"
                            ? Colors.grey
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    data['status']!,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
