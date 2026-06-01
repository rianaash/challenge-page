import 'package:flutter/material.dart';
import 'package:challenge_app/core/constants/app_assets.dart';
import 'package:challenge_app/core/theme/app_colors.dart';
import 'package:challenge_app/core/theme/app_spacing.dart';
import 'package:challenge_app/core/theme/app_text_styles.dart';
import 'package:challenge_app/features/challenge/presentation/widgets/challenge_card.dart';
import 'package:challenge_app/features/challenge/presentation/widgets/section_header.dart';
import 'package:challenge_app/shared/widgets/category_chip.dart';
import 'package:challenge_app/shared/widgets/custom_app_bar.dart';
import 'package:challenge_app/shared/widgets/custom_bottom_nav_bar.dart'; // Impor Nav Bar baru

class FindPage extends StatelessWidget {
  const FindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mendorong konten utama agar meluas di bawah Navigation Bar demi kelancaran scrolling
      extendBody: true,
      
      // ==========================================
      // GLOWING CENTER FLOATING ACTION BUTTON (FAB)
      // ==========================================
      floatingActionButton: Container(
        height: 64,
        width: 64,
        margin: const EdgeInsets.only(top: 30), // Menggeser sedikit ke bawah agar menyatu dengan dock
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // Cincin Emas luar (Gold Ring) sesuai screenshot
          border: Border.all(color: AppColors.fabRing, width: 3),
          // Efek Neon Glow Biru yang menyala mewah
          boxShadow: [
            BoxShadow(
              color: AppColors.fabBackground.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () => debugPrint('Center FAB (+ Button) clicked'),
          backgroundColor: AppColors.fabBackground,
          elevation: 0,
          highlightElevation: 0,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // ==========================================
      // CUSTOM BOTTOM NAVIGATION BAR
      // ==========================================
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1, // Default aktif di indeks ke-1 ('Find')
        onTabSelected: (index) {
          debugPrint('Bottom Nav Tab $index clicked');
        },
      ),

      // ==========================================
      // MAIN CONTENT BODY WITH PREMIUM BACKGROUND
      // ==========================================
      body: Container(
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
          // Agar bottom nav tidak menutupi item paling bawah saat scroll mentok
          bottom: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Custom AppBar
                CustomAppBar(
                  title: 'Find',
                  onBackTap: () => debugPrint('Back Button clicked'),
                ),
                
                const SizedBox(height: AppSpacing.m),

                // 2. Horizontal Category Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
                  child: Row(
                    children: [
                      CategoryChip(
                        icon: '🗓️',
                        label: 'Challenge',
                        onTap: () => debugPrint('Challenge Chip clicked'),
                      ),
                      const SizedBox(width: AppSpacing.s),
                      CategoryChip(
                        icon: '⏰',
                        label: 'Timer',
                        onTap: () => debugPrint('Timer Chip clicked'),
                      ),
                      const SizedBox(width: AppSpacing.s),
                      CategoryChip(
                        icon: '🏷️',
                        label: 'Affirmation',
                        onTap: () => debugPrint('Affirmation Chip clicked'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.l),

                // 3. Section Trending
                const SectionHeader(
                  icon: Text('🔥', style: TextStyle(fontSize: 18)),
                  title: 'Trending',
                ),

                const SizedBox(height: AppSpacing.m),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
                  child: Row(
                    children: [
                      ChallengeCard(
                        imageAsset: AppAssets.imgClean,
                        onTap: () => debugPrint('Clean Home Card clicked'),
                      ),
                      const SizedBox(width: AppSpacing.m),
                      ChallengeCard(
                        imageAsset: AppAssets.imgDetox,
                        onTap: () => debugPrint('Digital Detox Card clicked'),
                      ),
                      const SizedBox(width: AppSpacing.m),
                      ChallengeCard(
                        imageAsset: AppAssets.imgNoPhone,
                        onTap: () => debugPrint('No Phone Card clicked'),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppSpacing.xl),

                // 4. Section Routine
                const SectionHeader(
                  icon: Text('📋', style: TextStyle(fontSize: 18)),
                  title: 'Routine',
                ),

                const SizedBox(height: AppSpacing.m),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
                  child: Row(
                    children: [
                      const Text('🥗', style: TextStyle(fontSize: 18)),
                      const SizedBox(width: AppSpacing.s),
                      Text(
                        'Healthy habits',
                        style: AppTextStyles.heading2.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
                        onTap: () => debugPrint('Eat Healthy Card clicked'),
                      ),
                      const SizedBox(width: AppSpacing.m),
                      ChallengeCard(
                        imageAsset: AppAssets.imgMorningRun,
                        onTap: () => debugPrint('Morning Run Card clicked'),
                      ),
                      const SizedBox(width: AppSpacing.m),
                      ChallengeCard(
                        imageAsset: AppAssets.imgDrink,
                        onTap: () => debugPrint('Drink Water Card clicked'),
                      ),
                    ],
                  ),
                ),
                
                // Jarak aman di bawah agar konten carousel tidak tertutup floating dock
                const SizedBox(height: 130), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}