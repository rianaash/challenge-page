import 'package:flutter/material.dart';
import 'package:challenge_app/core/constants/app_assets.dart';
import 'package:challenge_app/core/theme/app_colors.dart';
import 'package:challenge_app/core/theme/app_spacing.dart';
import 'package:challenge_app/core/theme/app_text_styles.dart';
import 'package:challenge_app/features/challenge/presentation/widgets/challenge_card.dart';
import 'package:challenge_app/features/challenge/presentation/widgets/section_header.dart';
import 'package:challenge_app/shared/widgets/category_chip.dart';
import 'package:challenge_app/shared/widgets/custom_app_bar.dart';
import 'package:challenge_app/features/challenge/presentation/pages/challenge_detail_page.dart';

class FindPage extends StatelessWidget {
  const FindPage({super.key});

  void _navigateToDetail(BuildContext context, String image, String title, String desc) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChallengeDetailPage(
          imageAsset: image,
          title: title,
          description: desc,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // KITA LANGSUNG RETURN CONTAINER, BUKAN SCAFFOLD LAGI
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.backgroundBase,
        image: DecorationImage(
          image: AssetImage(AppAssets.imgPremiumBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: 'Find', onBackTap: () {}),
              const SizedBox(height: AppSpacing.m),

              // ... (CATEGORY CHIPS) ...
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
                child: Row(
                  children: [
                    CategoryChip(icon: '🗓️', label: 'Challenge', onTap: () {}),
                    const SizedBox(width: AppSpacing.s),
                    CategoryChip(icon: '⏰', label: 'Timer', onTap: () {}),
                    const SizedBox(width: AppSpacing.s),
                    CategoryChip(icon: '🏷️', label: 'Affirmation', onTap: () {}),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.l),

              // ... (SECTION 1: TRENDING) ...
              const SectionHeader(icon: Text('🔥', style: TextStyle(fontSize: 18)), title: 'Trending'),
              const SizedBox(height: AppSpacing.m),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
                child: Row(
                  children: [
                    ChallengeCard(
                      imageAsset: AppAssets.imgClean,
                      onTap: () => _navigateToDetail(context, AppAssets.imgClean, 'Clean Home', 'Cleaning your home is not just about neatness...'),
                    ),
                    const SizedBox(width: AppSpacing.m),
                    ChallengeCard(
                      imageAsset: AppAssets.imgDetox,
                      onTap: () => _navigateToDetail(context, AppAssets.imgDetox, 'Digital Detox', 'Take a break from constant notifications...'),
                    ),
                    const SizedBox(width: AppSpacing.m),
                    ChallengeCard(
                      imageAsset: AppAssets.imgRoutine,
                      onTap: () => _navigateToDetail(context, AppAssets.imgRoutine, 'Morning Routine', 'Start your day with intention...'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // ... (SECTION 2: ROUTINE) ...
              const SectionHeader(icon: Text('📋', style: TextStyle(fontSize: 18)), title: 'Routine'),
              const SizedBox(height: AppSpacing.m),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
                child: Row(
                  children: [
                    const Text('🥗', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: AppSpacing.s),
                    Text('Healthy habits', style: AppTextStyles.heading2.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.m),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
                child: Row(
                  children: [
                    ChallengeCard(
                      imageAsset: AppAssets.imgEat,
                      onTap: () => _navigateToDetail(context, AppAssets.imgEat, 'Eat Healthy', 'Fuel your body with the nutrients...'),
                    ),
                    const SizedBox(width: AppSpacing.m),
                    ChallengeCard(
                      imageAsset: AppAssets.imgMorningRun,
                      onTap: () => _navigateToDetail(context, AppAssets.imgMorningRun, 'Morning Run', 'Start your day with energy...'),
                    ),
                    const SizedBox(width: AppSpacing.m),
                    ChallengeCard(
                      imageAsset: AppAssets.imgDrink,
                      onTap: () => _navigateToDetail(context, AppAssets.imgDrink, 'Drink Water', 'Stay hydrated and take care of your body...'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // ... (SECTION 3: PRODUCTIVITY) ...
              const SectionHeader(icon: Text('⚡', style: TextStyle(fontSize: 18)), title: 'Productivity'),
              const SizedBox(height: AppSpacing.m),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
                child: Row(
                  children: [
                    ChallengeCard(
                      imageAsset: AppAssets.imgNoPhone,
                      onTap: () => _navigateToDetail(context, AppAssets.imgNoPhone, 'No Phone', 'Take a break from constant notifications...'),
                    ),
                    const SizedBox(width: AppSpacing.m),
                    ChallengeCard(
                      imageAsset: AppAssets.imgDeepWork,
                      onTap: () => _navigateToDetail(context, AppAssets.imgDeepWork, 'Deep Work Focus', 'Train your mind to focus deeply...'),
                    ),
                    const SizedBox(width: AppSpacing.m),
                    ChallengeCard(
                      imageAsset: AppAssets.imgGratitude,
                      onTap: () => _navigateToDetail(context, AppAssets.imgGratitude, 'Gratitude Challenge', 'Shift your focus to the positive...'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // ... (SECTION 4: LIFESTYLE & SKINCARE) ...
              const SectionHeader(icon: Text('✨', style: TextStyle(fontSize: 18)), title: 'Lifestyle & Skincare'),
              const SizedBox(height: AppSpacing.m),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
                child: Row(
                  children: [
                    ChallengeCard(
                      imageAsset: AppAssets.imgSkincare,
                      onTap: () => _navigateToDetail(context, AppAssets.imgSkincare, 'Skincare', 'Give your hair and skin the attention...'),
                    ),
                    const SizedBox(width: AppSpacing.m),
                    ChallengeCard(
                      imageAsset: AppAssets.imgFaceYoga,
                      onTap: () => _navigateToDetail(context, AppAssets.imgFaceYoga, 'Face Yoga', 'Take a moment to care for your skin...'),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 130), 
            ],
          ),
        ),
      ),
    );
  }
}