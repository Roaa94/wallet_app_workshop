import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_app_workshop/core/styles.dart';
import 'package:wallet_app_workshop/on-boarding/on_boarding_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const WalletApp());
}

class WalletApp extends StatelessWidget {
  const WalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet App Workshop',
      theme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      home: const OnBoardingPage(),
    );
  }
}
