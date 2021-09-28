import 'package:flutter/material.dart';

// ignorar colores entre el rango 100 y 800

class ColorsApp {
  static const Color primaryColor = Color(0xFF46B2E0);
  static const Color secondaryPromoColor = Color(0xFF46B2E0);
  static const Color terciaryPromoColor = Color(0xFFFFFFFF);
  static const Color tagBackgroundColor = Color(0xFF207398);
  static const int _primaryColor = 0xFF207398;
  static const MaterialColor principalColor = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xFF46B2E0),
      100: Color(0xFF38CC70),
      200: Color(0xFF38CC77),
      300: Color(0xFF1FAA59),
      400: Color(0xFF1FAA59),
      500: Color(0xFF19944C),
      600: Color(0xFF66AD47),
      700: Color(0xFF4DD637),
      800: Color(0xFF4DD637),
      900: Color(0xFF46B2E0),
    },
  );
}
