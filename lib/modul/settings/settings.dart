import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/core/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  // final List<String> _langauges = ["English", "عربي"];
  // final List<String> _theme = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    final List<String> langauges = ["English", "عربي"];
    final List<String> theme0 = [lang.light, lang.dark];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 20),
          child: Text(lang.langauge, style: theme.textTheme.bodyLarge),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDropdown<String>(
          hintText: 'Select Langauge',
          items: langauges,
          initialItem:
              provider.currentLangauge == "en" ? langauges[0] : langauges[1],
          onChanged: (value) {
            if (value == "English") {
              provider.changeCurrentLangauge("en");
            }
            if (value == "عربي") {
              provider.changeCurrentLangauge("ar");
            }
            log('changing value to: $value');
          },
          decoration: CustomDropdownDecoration(
            closedFillColor:
                provider.isDark() ? const Color(0xff141A2E) : Colors.white,
            closedSuffixIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: provider.isDark() ? theme.primaryColorDark : Colors.black,
            ),
            expandedFillColor:
                provider.isDark() ? const Color(0xff141A2E) : Colors.white,
            expandedSuffixIcon: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: provider.isDark() ? theme.primaryColorDark : Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(lang.mode, style: theme.textTheme.bodyLarge),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDropdown<String>(
          hintText: 'Select Theme',
          items: theme0,
          initialItem: provider.currentThemeMode == ThemeMode.light
              ? theme0[0]
              : theme0[1],
          onChanged: (value) {
            if (value == "Light" || value == "فاتح") {
              provider.changeCurrentTheme(ThemeMode.light);
            }
            if (value == "Dark" || value == "داكن") {
              provider.changeCurrentTheme(ThemeMode.dark);
            }
            log('changing value to: $value');
          },
          decoration: CustomDropdownDecoration(
            closedFillColor:
                provider.isDark() ? const Color(0xff141A2E) : Colors.white,
            closedSuffixIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: provider.isDark() ? theme.primaryColorDark : Colors.black,
            ),
            expandedFillColor:
                provider.isDark() ? const Color(0xff141A2E) : Colors.white,
            expandedSuffixIcon: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: provider.isDark() ? theme.primaryColorDark : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
