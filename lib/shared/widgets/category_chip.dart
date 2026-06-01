import 'package:flutter/material.dart';
import 'package:challenge_app/core/theme/app_colors.dart';
import 'package:challenge_app/core/theme/app_radius.dart';
import 'package:challenge_app/core/theme/app_spacing.dart';
import 'package:challenge_app/core/theme/app_text_styles.dart';

class CategoryChip extends StatelessWidget {
  final String icon; // Menggunakan String untuk emoji icon
  final String label;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.m,
          vertical: AppSpacing.s,
        ),
        decoration: BoxDecoration(
          color: AppColors.chipBackground,
          border: Border.all(color: AppColors.border, width: 1.5),
          borderRadius: AppRadius.borderRadiusCircular, // Pill shape
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(icon, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: AppSpacing.s),
            Text(label, style: AppTextStyles.button),
          ],
        ),
      ),
    );
  }
}