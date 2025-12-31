import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constants/colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    jumToNextPage();
    super.initState();
  }

  void jumToNextPage() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed("/Login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/images/img.png", fit: BoxFit.cover),
            ),
             SizedBox(height: 20),
             Text(
            "Polytechnic Management System",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            Text(
              "(My Campus)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
