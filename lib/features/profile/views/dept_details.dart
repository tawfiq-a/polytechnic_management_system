import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeptDetailView extends StatelessWidget {
  const DeptDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBanner(),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("About Department"),
                  const SizedBox(height: 15),
                  const Text(
                    "Munshiganj Polytechnic Institute is a center of technical excellence, empowering students with practical skills, industry-relevant knowledge, and a future-ready mindset. We focus on hands-on learning, modern technology, and professional development to help students build strong careers and contribute confidently to the nation's growth.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/cst.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 40),

                  _buildSectionTitle("DEPARTMENT INFORMATION"),
                  const SizedBox(height: 20),

                  _buildInfoItem(
                    "21-12-2025",
                    "Computer science and technology",
                  ),
                  _buildInfoItem("21-12-2025", "Lorem Ipsum Syllabus"),
                  _buildInfoItem("21-12-2025", "Semester Course Plan"),
                  _buildInfoItem("21-12-2025", "Department Notice"),
                  _buildInfoItem("21-12-2025", "Lab Equipment List"),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBanner() {
    return Stack(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/1.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.darken,
              ),
            ),
          ),
        ),

        SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Computer science and technology (CST)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF003D4D),
          ),
        ),
        const SizedBox(height: 4),
        Container(height: 2, width: 60, color: Colors.lightBlue[300]),
      ],
    );
  }

  Widget _buildInfoItem(String date, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 5),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Text(
            date,
            style: const TextStyle(fontSize: 11, color: Colors.black54),
          ),
          const SizedBox(width: 10),
          const Text("|", style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),

          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download, size: 12, color: Colors.white),
            label: const Text(
              "Download",
              style: TextStyle(fontSize: 9, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003D4D),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: const Size(60, 28),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
