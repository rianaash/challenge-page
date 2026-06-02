import 'package:flutter/material.dart';
import 'package:challenge_app/core/constants/app_assets.dart';
import 'package:challenge_app/core/theme/app_colors.dart';
import 'package:challenge_app/features/challenge/presentation/pages/find_page.dart';
import 'package:challenge_app/shared/widgets/custom_bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Kita set default ke index 1 agar saat aplikasi dibuka, langsung masuk ke "Find" Page
  int _currentIndex = 1; 

  // Daftar halaman untuk setiap tab
  final List<Widget> _pages = [
    _buildDummyPage('Home Page'),       // Index 0: Home
    const FindPage(),                   // Index 1: Find (Halaman yang sudah kita buat)
    _buildDummyPage('Routine Page'),    // Index 2: Routine
    _buildDummyPage('Profile Page'),    // Index 3: Profile
  ];

  // Halaman sementara (placeholder) untuk tab yang belum kita desain
  static Widget _buildDummyPage(String title) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundBase,
        image: DecorationImage(
          image: AssetImage(AppAssets.imgPremiumBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Penting agar background memanjang ke bawah transparan dock
      
      // Konten halaman akan berubah sesuai tab yang diklik
      body: _pages[_currentIndex], 
      
      // ==========================================
      // GLOWING CENTER FAB KITA PINDAHKAN KESINI
      // ==========================================
      floatingActionButton: Container(
        height: 64,
        width: 64,
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.fabRing, width: 3),
          boxShadow: [
            BoxShadow(
              color: AppColors.fabBackground.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () => debugPrint('Add button clicked from Main Page'),
          backgroundColor: AppColors.fabBackground,
          elevation: 0,
          shape: const CircleBorder(),
          child: const Icon(Icons.add_rounded, color: Colors.white, size: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      // ==========================================
      // BOTTOM NAV KITA PINDAHKAN KESINI
      // ==========================================
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index; // Update state untuk ganti halaman
          });
        },
      ),
    );
  }
}
