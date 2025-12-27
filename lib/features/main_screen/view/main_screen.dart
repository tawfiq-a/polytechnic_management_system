import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';
import 'package:poly_manage_systm/features/blood_donation/views/blood_donation.dart';
import 'package:poly_manage_systm/features/campus_location/views/location_view.dart';
import 'package:poly_manage_systm/features/exam_control/views/exm_view.dart';

import 'package:poly_manage_systm/features/register_management/views/dash_reg_main.dart';

import '../../../core/widgets/ddashboard_card.dart';
import '../../library_management/views/library_view.dart';
import '../../notice/views/notice_view.dart';
import '../../polytechnic_management/views/main_layout.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/1.jpeg',
      'assets/images/2.jpeg',
      'assets/images/3.jpeg',
      'assets/images/5.jpeg',
      'assets/images/4.jpeg',
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset("assets/images/img.png"),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Munshiganj Polytechnic Institute",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Mirkadim, Munshiganj",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Container(
                    //   padding: EdgeInsets.all(10),
                    //   color: AppColors.primary,
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         width: 50,
                    //         height: 50,
                    //         child: Image.asset("assets/images/img.png"),
                    //       ),
                    //       const SizedBox(width: 10),
                    //       Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             "Munshiganj Polytechnic Institute",
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           Text(
                    //             "Mirkadim, Munshiganj",
                    //             style: TextStyle(fontSize: 16,
                    //               color: Colors.white,),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Text(
                      "Munshiganj Polytechnic Institute is a government polytechnic institute. It was established in 2006. This institute conducts 4 years Diploma-in-Engineering course under BTEB.  Here are 7 technologies.",
                      style: TextStyle(fontSize: 16),
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
                      milliseconds: 900,
                    ),
                    viewportFraction: 0.8,
                  ),
                  items: imgList
                      .map(
                        (item) => Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.5),
                                spreadRadius: 2,
                                blurRadius: 9,
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
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

              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    DashboardCard(
                      onTap: () {
                        Get.to(() =>  PolyMain());
                      },
                      title: "Polytechnic Management",
                      icon: Icons.school,
                    ),
                    DashboardCard(
                      title: "Library Management ",
                      icon: Icons.book_outlined,
                      onTap: () {
                        Get.to(() => LibraryManagement());
                      },
                    ),
                    DashboardCard(
                      onTap: () {
                        Get.to(() => MainView());
                      },
                      title: "Register Management",
                      icon: Icons.account_balance,
                    ),
                    DashboardCard(
                      onTap: () {
                        Get.to(() => ExamView());
                      },
                      title: "Exam Management",
                      icon: Icons.calendar_today,
                    ),
                    DashboardCard(
                      onTap: () {
                        Get.to(() => AllNoticesView());
                      },
                      title: "Notice",
                      icon: Icons.notifications_active,
                    ),
                    DashboardCard(
                      onTap: () {
                        Get.to(() => CampusLocationView());
                      },
                      title: "Campus Navigator",
                      icon: Icons.location_on_outlined,
                    ),
                    DashboardCard(
                      onTap: () {
                        Get.to(() => BloodDonationView());
                      },
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
