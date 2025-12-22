import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/widgets/ddashboard_card.dart';
import '../../../routes/app_routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://lh3.googleusercontent.com/gps-cs-s/AG0ilSyRYZn0X1afBwRNxWrk8DLgjFQLD42qeNOsp9_WTpQSCL-eCWJ-_2hgh9MqkooYZpCGZjNSeh3P0bG_JwQEgtjIXFjUpbBNW58yEA0UXWB8mLVf1BAFoQrEIie1pDxxZkk3a0o=s680-w680-h510-rw',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1ufNcESqpdhuL1dTiTOZLtJOlXfDSTSnlJA&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ16_CNaaaz7FZKpfue_kU7epramHTSKEgVVA&s',
      'https://diplomabd.com/wp-content/uploads/2017/02/munshiganj-e1693044919312.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Munshiganj_Polytechnic_Institute_8.jpg/1280px-Munshiganj_Polytechnic_Institute_8.jpg',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,

        title: const Text(
          "MUPI Management System",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset("assets/images/img.png"),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Munshiganj Polytechnic Institute",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Mirkadim, Munshiganj",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Text(
                      "Munshiganj Polytechnic Institute is a government polytechnic institute. It was established in 2006. This institute conducts 4 years Diploma-in-Engineering course under BTEB.  Here are 7 technologies.",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),

              Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 800,
                    ),
                    viewportFraction: 0.8,
                  ),
                  items: imgList
                      .map(
                        (item) => Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber.shade400,
                                spreadRadius: 1,
                                blurRadius: 9,
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: 1000,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    DashboardCard(title: "Polytechnic Management", icon: Icons.school),
                    DashboardCard(
                      title: "Library Management  ",
                      icon: Icons.book_outlined,
                    ),
                    DashboardCard(
                      title: "Register Management",
                      icon: Icons.account_balance,
                    ),
                    DashboardCard(title: "Exam Management", icon: Icons.calendar_today,onTap: (){Get.toNamed(AppRoutes.dashboard);
                    },),
                    DashboardCard(
                      title: "Notice",
                      icon: Icons.notification_important_outlined,
                    ),
                    DashboardCard(
                      title: "Campus Location",
                      icon: Icons.location_on_outlined,
                    ),
                    DashboardCard(
                      title: "Blood Donation",
                      icon: Icons.bloodtype,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
