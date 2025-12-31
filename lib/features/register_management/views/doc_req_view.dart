import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Request Academic Documents",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF003D4D),
            ),
          ),
          const SizedBox(height: 20),
          _buildRequestCard("Transfer Certificate (TC)", Icons.card_membership),
          _buildRequestCard("Semester Marksheet", Icons.assignment),
          _buildRequestCard("Testimonial", Icons.verified),
          _buildRequestCard("Appraisal Letter", Icons.rate_review),
          const SizedBox(height: 30),
          const Text(
            "Reason for Request",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Why do you need this document?",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003D4D),
              ),
              child: const Text(
                "Submit Request",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestCard(String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: CheckboxListTile(
        value: false,
        onChanged: (v) {},
        secondary: Icon(icon, color: const Color(0xFF003D4D)),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
