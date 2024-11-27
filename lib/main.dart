import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories_secreen.dart';

final theme = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.latoTextTheme(),
    colorScheme: ColorScheme.fromSeed(
       seedColor: const Color.fromARGB(255, 131, 57, 0),
      brightness: Brightness.dark,
    ));
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
