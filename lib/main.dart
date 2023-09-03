import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kundali_gpt/constants/colors.dart';
import 'package:kundali_gpt/constants/constant.dart';
import 'package:kundali_gpt/splash_screen.dart';

import 'module/introduction_animation/introduction_animation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KundaliGPT',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: rubyRed,
        primarySwatch: primary,
        // colorScheme: ColorScheme.fromSwatch(
        //   primarySwatch: primary
        // ),
        // scaffoldBackgroundColor: primary.shade50,
        textTheme: GoogleFonts.aBeeZeeTextTheme(textTheme),
        // primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
