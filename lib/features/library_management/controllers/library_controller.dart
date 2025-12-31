import 'package:get/get.dart';

class LibraryController extends GetxController {
  // ০ = Available Books, ১ = Borrow Request, ২ = History
  var selectedIndex = 0.obs;


  var books = [
    {
      "title": "System Analysis",
      "author": "John Smith",
      "status": "Available",
      "image": "assets/images/book1.jpg",
    },
    {
      "title": "Network Admin",
      "author": "Alan Walker",
      "status": "Borrowed",
      "image": "assets/images/book2.jpg",
    },
    {
      "title": "Web Technology",
      "author": "Mark Wood",
      "status": "Available",
      "image": "assets/images/book3.jpg",
    },
  ].obs;

  var history = [
    {"title": "Data Structure", "date": "12 May 2024", "status": "Returned"},
    {"title": "Java Programming", "date": "Active", "status": "Borrowed"},
  ].obs;

  void changePage(int index) {
    selectedIndex.value = index;
    Get.back();
  }
}
