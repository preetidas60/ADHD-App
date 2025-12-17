import 'package:flutter/material.dart';

class ToolboxExact extends StatelessWidget {
  final double width;
  final String imagePath;   // image instead of icon
  final Color iconBg;
  final String title;
  final String subtitle;
  final Color bg;

  const ToolboxExact({
    required this.width,
    required this.imagePath,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE CIRCLE (flat, exact)
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12), // balanced like image
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const Spacer(),

          /// TEXT
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
