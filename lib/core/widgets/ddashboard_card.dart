import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap; // ট্যাপ হ্যান্ডেল করার জন্য কলব্যাক

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // ম্যাটেরিয়াল কালার ট্রান্সপারেন্ট রাখা হয়েছে
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(16), // এটি কন্টেইনারের রেডিয়াসের সাথে মিলতে হবে
        splashColor: Colors.amber.withOpacity(0.2), // ক্লিক করলে আম্বার কালারের ঢেউ দেখা যাবে
        highlightColor: Colors.amber.withOpacity(0.1), // চেপে ধরে রাখলে যে কালার হবে
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber, width: 2),
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // একটি সুন্দর সার্কেল ব্যাকগ্রাউন্ড আইকনের জন্য (অপশনাল)
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 35, color: Colors.amber),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}