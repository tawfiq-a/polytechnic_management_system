import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CGPAController extends GetxController {

  final List<TextEditingController> controllers = List.generate(
    8,
    (index) => TextEditingController(),
  );

  var resultCGPA = 0.0.obs;

  final List<double> weights = [0.05, 0.10, 0.10, 0.10, 0.20, 0.20, 0.20, 0.05];

  void calculateCGPA() {
    double total = 0;
    bool hasValue = false;

    for (int i = 0; i < 8; i++) {
      double gpa = double.tryParse(controllers[i].text) ?? 0.0;
      if (gpa > 0) {
        total += gpa * weights[i];
        hasValue = true;
      }
    }

    if (hasValue) {
      resultCGPA.value = total;
    } else {
      Get.snackbar(
        "Error",
        "Please enter at least one GPA",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void reset() {
    for (var controller in controllers) {
      controller.clear();
    }
    resultCGPA.value = 0.0;
  }
}
