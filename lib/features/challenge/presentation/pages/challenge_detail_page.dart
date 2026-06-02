import 'package:flutter/material.dart';
import 'package:challenge_app/core/constants/app_assets.dart';
import 'package:challenge_app/core/theme/app_colors.dart';
import 'package:challenge_app/core/theme/app_radius.dart';
import 'package:challenge_app/core/theme/app_spacing.dart';
import 'package:challenge_app/core/theme/app_text_styles.dart';

class ChallengeDetailPage extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  const ChallengeDetailPage({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. BACKGROUND PREMIUM
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.backgroundBase,
              image: DecorationImage(
                image: AssetImage(AppAssets.imgPremiumBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. KONTEN UTAMA (SCROLLABLE)
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tombol Back
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
                    ),
                  ),
                  
                  const SizedBox(height: AppSpacing.m),

                  // Gambar Cover Challenge dengan HERO ANIMATION
                  Hero(
                    tag: imageAsset, // Harus sama persis dengan tag di ChallengeCard
                    child: Container(
                      width: double.infinity,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.borderRadiusL,
                        image: DecorationImage(
                          image: AssetImage(imageAsset),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.m),

                  // Row Tags: Diamond & Days
                  Row(
                    children: [
                      _buildTag(Icons.diamond_outlined, '+10', const Color(0xFF1E88E5)),
                      const SizedBox(width: AppSpacing.s),
                      _buildTag(Icons.flag_outlined, '21 days', const Color(0xFFE53935)),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.l),

                  // Meta Data
                  Text(
                    'August 26, 2025 • 1 min read',
                    style: AppTextStyles.bodyText.copyWith(
                      color: AppColors.textSecondary.withOpacity(0.7),
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.s),

                  // Judul
                  Text(
                    title,
                    style: AppTextStyles.heading1.copyWith(fontSize: 24),
                  ),

                  const SizedBox(height: AppSpacing.m),

                  // Deskripsi
                  Text(
                    description,
                    style: AppTextStyles.bodyText.copyWith(
                      height: 1.6,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),

          // 3. TOMBOL FLOATING "ADD TO MY ROUTINE"
          Positioned(
            bottom: 40,
            left: AppSpacing.l,
            right: AppSpacing.l,
            child: GestureDetector(
              onTap: () => debugPrint('Add to routine clicked'),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: AppColors.chipBackground.withOpacity(0.9),
                  borderRadius: AppRadius.borderRadiusCircular,
                  border: Border.all(color: AppColors.border.withOpacity(0.5), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  'Add to my routine',
                  style: AppTextStyles.button.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(IconData icon, String text, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.chipBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 16),
          const SizedBox(width: 6),
          Text(text, style: TextStyle(color: iconColor, fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }
}