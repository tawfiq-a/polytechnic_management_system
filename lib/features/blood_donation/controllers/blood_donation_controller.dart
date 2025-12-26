import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart'; // কল করার জন্য এই প্যাকেজটি লাগবে

class BloodDonationController extends GetxController {
  // সব ব্লাড গ্রুপ
  final List<String> bloodGroups = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];

  var selectedGroup = "All".obs;

  // ডামি ডোনার লিস্ট (এটি পরে আপনার ডাটাবেজ থেকে আসবে)
  var allDonors = [
    {"name": "Atikur Rahman", "group": "O+", "dept": "CST", "phone": "01707000000"},
    {"name": "Tanvir Ahmed", "group": "A+", "dept": "Civil", "phone": "01800000000"},
    {"name": "Rahat Kabir", "group": "B+", "dept": "Power", "phone": "01900000000"},
    {"name": "Sabbir Hossain", "group": "O+", "dept": "CST", "phone": "01500000000"},
  ].obs;

  // ফিল্টার করা লিস্ট
  var filteredDonors = <Map<String, String>>[].obs;

  @override
  void onInit() {
    filteredDonors.assignAll(allDonors);
    super.onInit();
  }

  // ব্লাড গ্রুপ অনুযায়ী ফিল্টার করার ফাংশন
  void filterByGroup(String group) {
    selectedGroup.value = group;
    if (group == "All") {
      filteredDonors.assignAll(allDonors);
    } else {
      filteredDonors.assignAll(allDonors.where((d) => d['group'] == group).toList());
    }
  }

  // সরাসরি কল করার ফাংশন
  void makeCall(String phone) async {
    final Uri url = Uri.parse("tel:$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}