import 'package:flutter/material.dart';
import 'package:challenge_app/core/theme/app_colors.dart';
import 'package:challenge_app/core/theme/app_radius.dart';
import 'package:challenge_app/core/theme/app_spacing.dart';
import 'package:challenge_app/core/theme/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final Widget icon; // Bisa Icon atau Emoji Text
  final String title;

  const SectionHeader({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding standar kiri layar
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: Row(
        children: [
          // Tab container untuk Icon
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.m,
              vertical: AppSpacing.s,
            ),
            decoration: BoxDecoration(
              color: AppColors.chipBackground,
              border: Border.all(color: AppColors.border, width: 1.5),
              borderRadius: AppRadius.borderRadiusCircular,
            ),
            child: Row(
              children: [
                icon,
                const SizedBox(width: AppSpacing.s),
                Text(
                  title,
                  style: AppTextStyles.button.copyWith(color: const Color(0xFFC08945)), // Warna emas sesuai desain
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}