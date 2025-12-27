import 'package:get/get.dart';

class StudentTableController extends GetxController {
  // ডামি ডাটা লিস্ট
  var studentList = [
    {"name": "Giana", "roll": "28545", "dept": "Computer science...", "shift": "2nd", "session": "21-22", "phone": "01707*****"},
    {"name": "James", "roll": "28545", "dept": "Computer science...", "shift": "2nd", "session": "21-22", "phone": "01707*****"},
    {"name": "Nolan", "roll": "28545", "dept": "Computer science...", "shift": "2nd", "session": "21-22", "phone": "01707*****"},
    {"name": "Randy", "roll": "28545", "dept": "Computer science...", "shift": "2nd", "session": "21-22", "phone": "01707*****"},
    {"name": "Charlie", "roll": "28545", "dept": "Computer science...", "shift": "2nd", "session": "21-22", "phone": "01707*****"},
    {"name": "Mira", "roll": "28545", "dept": "Computer science...", "shift": "2nd", "session": "21-22", "phone": "01707*****"},
  ].obs;

  var currentPage = 0.obs;
}