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
// final themeTwo = AppTheme(
//   bg: const Color(0xFF001F2F),
//   card: const Color(0xFF003B46),
//   text: Colors.white,
//   subText: const Color(0xFFB0E0E6),
//   divider: const Color(0xFF4DA8DA),
//   icon: const Color(0xFF4DA8DA),   /// 🔥
//   boxGradient: const LinearGradient(
//     colors: [Color(0xFF004D60), Color(0xFF002F3A)],
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//   ),
// );

final themeTwo = AppTheme(
  bg: const Color(0xFF071E14),          /// 🔥 Deep Islamic Green BG
  card: const Color(0xFF0F2E21),        /// 🔥 Card Green

  text: Colors.white,

  subText: const Color(0xFFA8E6CF),     /// 🔥 Soft Mint Text
  divider: const Color(0xFF1F5C42),     /// 🔥 Divider Green

  icon: const Color(0xFF4CAF7A),        /// 🔥 Icon Green

  boxGradient: const LinearGradient(
    colors: [
      Color(0xFF1B5E3C),                /// 🔥 Top Emerald
      Color(0xFF0D3B2A),                /// 🔥 Bottom Deep Green
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);
