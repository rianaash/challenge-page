import 'package:flutter/material.dart';
import 'package:challenge_app/core/theme/app_colors.dart';
import 'package:challenge_app/core/theme/app_radius.dart';
import 'package:challenge_app/core/theme/app_spacing.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(
        left: AppSpacing.l,
        right: AppSpacing.l,
        bottom: AppSpacing.l, // Memberikan efek melayang (floating) dari bawah layar
      ),
      decoration: BoxDecoration(
        color: AppColors.bottomNavBackground.withOpacity(0.95), // Translusen premium
        borderRadius: AppRadius.borderRadiusL,
        border: Border.all(color: AppColors.border.withOpacity(0.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Kiri: Menu 1 & Menu 2
          _buildNavItem(Icons.home_rounded, 0, 'Home'),
          _buildNavItem(Icons.explore_rounded, 1, 'Find'),
          
          // Spacer tengah untuk memberikan ruang bagi Floating Action Button
          const SizedBox(width: 40),
          
          // Kanan: Menu 3 & Menu 4
          _buildNavItem(Icons.wb_sunny_rounded, 2, 'Routine'),
          _buildNavItem(Icons.person_rounded, 3, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, String label) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : AppColors.textSecondary.withOpacity(0.5),
            size: 26,
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}