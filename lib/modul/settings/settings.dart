import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "SettingsView",
        style: TextStyle(fontSize: 50, color: Color(0xff000000)),
      ),
    );
  }
}
