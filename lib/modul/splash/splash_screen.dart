import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/layout/layout_view.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, LayoutView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/Group 8.png",
      fit: BoxFit.cover,
    );
  }
}
