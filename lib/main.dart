import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wsem Dawoodi Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.cyanAccent,
        scaffoldBackgroundColor:
            const Color(0xFF0A0E17), // Deep dark blue-black
        canvasColor: const Color(0xFF111827), // slightly lighter card color
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E17),
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.cyanAccent,
          secondary: Colors.blueAccent,
          surface: const Color(0xFF1E293B),
        ),
        textTheme:
            GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
          displayLarge: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.white),
          displaySmall: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.w600, color: Colors.white),
          titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          bodyLarge: GoogleFonts.inter(color: Colors.grey[300]),
          bodyMedium: GoogleFonts.inter(color: Colors.grey[400]),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
