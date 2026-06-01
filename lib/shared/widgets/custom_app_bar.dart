import 'package:flutter/material.dart';
import 'package:challenge_app/core/theme/app_spacing.dart';
import 'package:challenge_app/core/theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBackTap;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Memberikan jarak dari pinggir layar
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.l,
        vertical: AppSpacing.m,
      ),
      child: Row(
        children: [
          // Tombol Back (Clickable)
          GestureDetector(
            onTap: onBackTap,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: AppSpacing.m),
          // Judul AppBar
          Text(
            title,
            style: AppTextStyles.heading1,
          ),
        ],
      ),
    );
  }
}