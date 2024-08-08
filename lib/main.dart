import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/core/settings_provider.dart';
import 'package:islami_app/core/theme/application_theme.dart';
import 'package:islami_app/layout/layout_view.dart';
import 'package:islami_app/modul/hadeth/widget/hadith_detailes.dart';
import 'package:islami_app/modul/quran/quran_detailes_view.dart';
import 'package:islami_app/modul/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLangauge),
      title: 'Islami App',
      theme: ApplicationThemeManager.lightTheme,
      darkTheme: ApplicationThemeManager.darkTheme,
      themeMode: provider.currentThemeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LayoutView.routeName: (context) => const LayoutView(),
        QuranDetailesView.routeName: (context) => const QuranDetailesView(),
        HadithDetailes.routeName: (context) => const HadithDetailes(),
      },
    );
  }
}
