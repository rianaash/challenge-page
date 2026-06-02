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
      child: Hero(
        // Tag harus unik, kita gunakan path string dari asset gambarnya
        tag: imageAsset, 
        child: Container(
          width: 170,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: AppRadius.borderRadiusL,
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}