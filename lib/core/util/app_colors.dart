
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    textTheme: TextTheme(
      labelMedium: GoogleFonts.italiana().copyWith(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      labelLarge: GoogleFonts.italiana().copyWith(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),

    ),
    useMaterial3: true,
  );
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
