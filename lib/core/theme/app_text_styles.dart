import 'package:flutter/material.dart';
import 'package:challenge_app/core/theme/app_colors.dart';

class AppTextStyles {
  // Gaya teks untuk Judul Utama (e.g., "Find", "Face Yoga")
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Gaya teks untuk Sub-Judul (e.g., "Healthy habits")
  static const TextStyle heading2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Gaya teks untuk Tombol dan Chips (e.g., "Challenge", "Add to my routine")
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Gaya teks untuk Deskripsi Panjang / Paragraph (INI YANG TADI MISSING)
  static const TextStyle bodyText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
}