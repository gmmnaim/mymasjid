import 'package:flutter/material.dart';

class AppTheme {

  final Color bg;
  final Color card;
  final Color text;
  final Color subText;
  final Color divider;
  final Color icon;     /// 🔥 ADD THIS
  final Gradient boxGradient;

  AppTheme({
    required this.bg,
    required this.card,
    required this.text,
    required this.subText,
    required this.divider,
    required this.icon,
    required this.boxGradient,
  });
}


/// DESIGN 1
final themeOne = AppTheme(
  bg: const Color(0xFF0B0C10),
  card: const Color(0xFF1C1F26),
  text: Colors.white,
  subText: Colors.white70,
  divider: Colors.white24,
  icon: Colors.white70,   /// 🔥
  boxGradient: const LinearGradient(
    colors: [Color(0xFF1B1E25), Color(0xFF14161C)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);


/// DESIGN 2
final themeTwo = AppTheme(
  bg: const Color(0xFF001F2F),
  card: const Color(0xFF003B46),
  text: Colors.white,
  subText: const Color(0xFFB0E0E6),
  divider: const Color(0xFF4DA8DA),
  icon: const Color(0xFF4DA8DA),   /// 🔥
  boxGradient: const LinearGradient(
    colors: [Color(0xFF004D60), Color(0xFF002F3A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

