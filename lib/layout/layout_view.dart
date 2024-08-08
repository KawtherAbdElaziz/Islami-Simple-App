import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/modul/hadeth/hadith.dart';
import 'package:islami_app/modul/quran/quran.dart';
import 'package:islami_app/modul/radio/radio.dart';
import 'package:islami_app/modul/sebha/sebha.dart';

import '../modul/settings/settings.dart';

class LayoutView extends StatefulWidget {
  static String routeName = "layouts";

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0;
  List<Widget> screensView = [
    QuranView(),
    const HadithView(),
    const SebhaView(),
    const RadioView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return DecoratedBox(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg3.png"))),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(lang.islami),
        ),
        body: screensView[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/icons/quran_icn.png")),
                label: lang.quran),
            BottomNavigationBarItem(
                icon:
                    const ImageIcon(AssetImage("assets/icons/hadith_icn.png")),
                label: lang.alahadith),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/icons/sebha_icn.png")),
                label: lang.sepha),
            BottomNavigationBarItem(
                icon:
                    const ImageIcon(AssetImage("assets/icons/radio_blue.png")),
                label: lang.radio),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: lang.settings),
          ],
        ),
      ),
    );
  }
}
