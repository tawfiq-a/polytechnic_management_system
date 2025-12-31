import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelfDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // এখানে আপনার রেজিস্ট্রেশন ডাটা দেখাবেন
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _infoItem("Full Name", "Atikur Rahman"),
        _infoItem("Roll", "651310"),
        _infoItem("Registration", "1502200***"),
        _infoItem("Department", "CST"),
        _infoItem("Shift", "2nd"),
        _infoItem("Session", "21-22"),
        _infoItem("Phone", "01707******"),
        _infoItem("Email", "atikur@gmail.com"),
      ],
    );
  }

  Widget _infoItem(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
