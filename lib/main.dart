import 'package:flutter/material.dart';
import 'package:widgets_app/config/themes/app_theme.dart';
import 'package:widgets_app/presentation/screens/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      home: HomeScreen(),
      routes: {
        '/buttons':(context)=>const ButtonsScreen(),
        '/cards':(context)=>const CardsScreen(),
      },
    );
  }
}
