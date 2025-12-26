import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationController extends GetxController {
  // ক্যাম্পাসের লোকেশন লিস্ট
  final List<Map<String, dynamic>> allLocations = [
    {"name": "Main Gate", "category": "Gate", "details": "Entrance of Campus", "lat": "23.8103", "long": "90.4125", "icon": "door_front_door"},
    {"name": "Central Library", "category": "Academic", "details": "Building 2, 3rd Floor", "lat": "23.8105", "long": "90.4128", "icon": "menu_book"},
    {"name": "Computer Dept.", "category": "Department", "details": "Academic Building 1", "lat": "23.8107", "long": "90.4130", "icon": "computer"},
    {"name": "Student Canteen", "category": "Food", "details": "Behind Admin Building", "lat": "23.8102", "long": "90.4120", "icon": "restaurant"},
    {"name": "Boys Hostel", "category": "Hostel", "details": "South Side of Campus", "lat": "23.8095", "long": "90.4115", "icon": "hotel"},
  ];

  var filteredLocations = <Map<String, dynamic>>[].obs;
  var searchQuery = "".obs;

  @override
  void onInit() {
    filteredLocations.assignAll(allLocations);
    super.onInit();
  }

  // সার্চ ফাংশন
  void searchLocation(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredLocations.assignAll(allLocations);
    } else {
      filteredLocations.assignAll(allLocations.where((loc) =>
          loc['name'].toString().toLowerCase().contains(query.toLowerCase())
      ).toList());
    }
  }

  // গুগল ম্যাপে লোকেশন ওপেন করার ফাংশন
  void openOnMap(String lat, String long) async {
    final String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    final Uri url = Uri.parse(googleMapsUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}