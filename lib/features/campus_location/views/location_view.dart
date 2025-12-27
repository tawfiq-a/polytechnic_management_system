import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/core/constants/colors.dart';
import '../controllers/location_controller.dart';

class CampusLocationView extends StatelessWidget {
  final controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Campus Navigator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // ১. সার্চ বার
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              onChanged: (value) => controller.searchLocation(value),
              decoration: InputDecoration(
                hintText: "Search buildings, depts...",
                prefixIcon: const Icon(Icons.search, color: Color(0xFF003D4D)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),

          // ২. লোকেশন লিস্ট
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: controller.filteredLocations.length,
                itemBuilder: (context, index) {
                  var loc = controller.filteredLocations[index];
                  return _buildLocationCard(loc);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // লোকেশন কার্ড ডিজাইন
  Widget _buildLocationCard(Map<String, dynamic> loc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF003D4D).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            _getIcon(loc['category']),
            color: const Color(0xFF003D4D),
          ),
        ),
        title: Text(
          loc['name'],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              loc['details'],
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                loc['category'],
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () => controller.openOnMap(loc['lat'], loc['long']),
          icon: const Icon(Icons.directions, color: Colors.blue),
          style: IconButton.styleFrom(
            backgroundColor: Colors.blue.withOpacity(0.05),
          ),
        ),
      ),
    );
  }

  // ক্যাটাগরি অনুযায়ী আইকন রিটার্ন করার ফাংশন
  IconData _getIcon(String category) {
    switch (category) {
      case 'Academic':
        return Icons.menu_book;
      case 'Department':
        return Icons.computer;
      case 'Food':
        return Icons.restaurant;
      case 'Hostel':
        return Icons.hotel;
      case 'Gate':
        return Icons.door_front_door;
      default:
        return Icons.location_on;
    }
  }
}
