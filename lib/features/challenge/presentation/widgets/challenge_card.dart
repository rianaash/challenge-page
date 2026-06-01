import 'package:flutter/material.dart';
import 'package:challenge_app/core/theme/app_radius.dart';

class ChallengeCard extends StatelessWidget {
  final String imageAsset;
  final VoidCallback onTap;

  const ChallengeCard({
    super.key,
    required this.imageAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170, // Lebar card disesuaikan dengan desain carousel
        height: 250, // Tinggi card
        decoration: BoxDecoration(
          borderRadius: AppRadius.borderRadiusL, // Sudut tumpul premium
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover, // Gambar memenuhi seluruh area card
          ),
          // Opsional: Berikan sedikit shadow untuk efek elevasi jika diperlukan
        ),
      ),
    );
  }
}