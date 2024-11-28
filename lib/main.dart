import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories_secreen.dart';

final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme(
    const TextTheme(
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white70),
      headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 131, 57, 0),
    brightness: Brightness.dark,
    primary: const Color.fromARGB(255, 180, 85, 20), // Vibrant primary color
    secondary: const Color.fromARGB(255, 255, 184, 77), // Complementary accent
    surface: const Color(0xFF1E1E1E), // Dark background for modern look

    onPrimary: Colors.white, // Text/icon color on primary
    onSecondary: Colors.black, // Text/icon color on secondary
    // Text color on background
    onSurface: Colors.white70, // Text color on surfaces
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2C2C2C),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 180, 85, 20),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF2C2C2C),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white70),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color.fromARGB(255, 255, 184, 77)),
    ),
    hintStyle: const TextStyle(color: Colors.white70),
    labelStyle: const TextStyle(color: Colors.white),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const CategoriesScreen(),
    );
  }
}
