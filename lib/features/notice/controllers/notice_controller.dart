import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NoticeController extends GetxController {
  // ডামি নোটিশ ডেটা
  var notices = List.generate(
    10,
    (index) => {
      "date": "21-12-2025",
      "title": index == 0
          ? "Exam Set Plane Notice"
          : index == 1
          ? "Registration Fee Submission Notice"
          : "Conference Notice",
    },
  ).obs;

  var selectedFilter = "All".obs;

  void changeFilter(String filter) {
    selectedFilter.value = filter;
    // এখানে ফিল্টার অনুযায়ী ডেটা লোড করার লজিক দিতে পারেন
  }
}
