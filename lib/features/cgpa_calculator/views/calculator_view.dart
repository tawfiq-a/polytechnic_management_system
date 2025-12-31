import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cgpa_controller.dart';

class CGPACalculatorView extends StatelessWidget {
  final controller = Get.put(CGPAController());

  CGPACalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "CGPA Calculator",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF003D4D),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: controller.reset,
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            _buildResultCard(),

            const SizedBox(height: 30),


            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 2.2,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return _buildSemesterInput(index);
              },
            ),

            const SizedBox(height: 40),


            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: controller.calculateCGPA,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003D4D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Calculate Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "* Calculated based on BTEB standard weights.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildResultCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF003D4D), Color(0xFF006884)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Your Cumulative GPA",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Obx(
            () => Text(
              controller.resultCGPA.value.toStringAsFixed(2),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Keep up the good work!",
            style: TextStyle(color: Colors.greenAccent, fontSize: 12),
          ),
        ],
      ),
    );
  }


  Widget _buildSemesterInput(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Semester ${index + 1}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller.controllers[index],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "0.00",
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
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
      ],
    );
  }
}
