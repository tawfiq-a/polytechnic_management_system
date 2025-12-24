import 'package:flutter/material.dart';

import '../constants/colors.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(16),
        splashColor: Colors.amber.withValues(alpha: 0.2),
        highlightColor: Colors.amber.withValues(alpha: 0.1),
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color:AppColors.primary, width: 2),
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

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 35, color: Colors.white),
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