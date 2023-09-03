import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kundali_gpt/constants/image_constants.dart';
import 'package:kundali_gpt/module/introduction_animation/introduction_animation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadScreen();
  }

  void loadScreen() {
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const IntroductionAnimationScreen(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SvgPicture.asset(
          ImgConstants.SPLASHSCREEN_LOGO,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
