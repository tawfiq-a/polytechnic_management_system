import 'package:get/get.dart';

class AppController extends GetxController {
  // ০ = Dashboard, ১ = Student, ২ = Payment
  var selectedIndex = 0.obs;

  void changeMenu(int index) {
    selectedIndex.value = index;
  }
}