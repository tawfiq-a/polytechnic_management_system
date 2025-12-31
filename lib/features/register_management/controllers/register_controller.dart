import 'package:get/get.dart';

class AccountsController extends GetxController {
  // 0 = Payment, 1 = Self Details, 3 = Document Request
  var selectedIndex = 0.obs;

  void changeMenu(int index) {
    selectedIndex.value = index;
    Get.back();
  }


  var paymentHistory = [
    {"id": "PX102", "amount": "2500 TK", "date": "12 May 2024", "status": "Success"},
    {"id": "PX105", "amount": "1500 TK", "date": "05 April 2024", "status": "Success"},
  ].obs;
}