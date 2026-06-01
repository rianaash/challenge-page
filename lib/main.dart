import 'package:flutter/material.dart';
import 'package:challenge_app/features/challenge/presentation/pages/find_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Premium Challenge App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        // Kita set scaffoldBackgroundColor transparan agar gradient dari Container terlihat sempurna
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: const FindPage(),
    );
  }
}