import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';

class AboutCampusView extends StatelessWidget {
  const AboutCampusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title:  Text(
          "About Campus",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //   About MUPI Section
            _buildSectionTitle("About MUPI"),
            const SizedBox(height: 15),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/img.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
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

            const SizedBox(height: 40),

            //   MUPI Gallery Section
            _buildSectionTitle("MUPI Gallery"),
            const SizedBox(height: 15),
            _buildGalleryGrid(),

            const SizedBox(height: 40),

            //   History of MUPI Section
            _buildSectionTitle("HISTORY of MUPI"),
            const SizedBox(height: 15),
            _buildVideoSection(),
            const SizedBox(height: 15),
            const Text(
              "Munshiganj Polytechnic Institute has a rich history of producing skilled engineers. Since its inception, it has been a beacon of technical education in the region, constantly evolving with modern technological advancements to provide the best learning experience for its students.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }


  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF003D4D),
          ),
        ),
        const SizedBox(height: 4),
        Container(height: 2, width: 50, color: Colors.lightBlue[300]),
      ],
    );
  }


  Widget _buildGalleryGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _galleryImage(
                'assets/images/4.jpeg',
                height: 250,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _galleryImage(
                    'assets/images/1.jpeg',
                    height: 121,
                  ),
                  const SizedBox(height: 8),
                  _galleryImage(
                    'assets/images/2.jpeg',
                    height: 121,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _galleryImage(
                'assets/images/3.jpeg',
                height: 120,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _galleryImage(
                'assets/images/5.jpeg',
                height: 120,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _galleryImage(
                'assets/images/4.jpeg',
                height: 120,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _galleryImage(String url, {double height = 150}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(url, height: height, fit: BoxFit.cover),
    );
  }


  Widget _buildVideoSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/1.jpeg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),

        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow,
            color: Color(0xFF003D4D),
            size: 40,
          ),
        ),
      ],
    );
  }
}
