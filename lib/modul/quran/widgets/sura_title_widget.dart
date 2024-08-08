import 'package:flutter/material.dart';
import 'package:islami_app/modul/quran/quran.dart';

class SuraTitleWidget extends StatelessWidget {
  final SuraData data;

  const SuraTitleWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(data.suraNumber, style: theme.textTheme.bodyMedium),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(data.suraTitle, style: theme.textTheme.bodyMedium),
          ),
        ),
      ],
    );
  }
}
