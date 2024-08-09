import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/settings_provider.dart';
import 'package:islami_app/modul/quran/quran.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranDetailesView extends StatefulWidget {
  const QuranDetailesView({super.key});

  static const String routeName = "QuranDetailes";

  @override
  State<QuranDetailesView> createState() => _QuranDetailesViewState();
}

class _QuranDetailesViewState extends State<QuranDetailesView> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context)!;

    var data = ModalRoute.of(context)?.settings.arguments as SuraData;
    var theme = Theme.of(context);
    if (content.isEmpty) loadData(data.suraNumber);
    return DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(provider.getBackgroundImage()))),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              lang.islami,
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 90,
              left: 29,
              right: 29,
            ),
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 41,
              right: 41,
            ),
            alignment: Alignment.center,
            width: 354,
            height: 652,
            // color: Color(0xffF8F8F8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: provider.isDark()
                  ? const Color(0xff141a2b).withOpacity(0.8)
                  : const Color(0xffF8F8F8).withOpacity(0.8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("سورة ${data.suraTitle}",
                        style: theme.textTheme.bodyMedium),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.play_circle,
                      size: 27.2,
                      color: provider.isDark()
                          ? const Color(0xffFACC1D)
                          : Colors.black,

                    )
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      String verse = versesList[index];
                      return Text(
                        "$verse(${index + 1})",
                        // "({${index + 1}})${versesList[index]}",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: theme.textTheme.bodySmall?.copyWith(
                          height: 2,
                        ),
                        // softWrap: true,
                      );
                    },
                    itemCount: versesList.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  String content = "";
  List<String> versesList = [];

  Future<void> loadData(String suraNumber) async {
    content = await rootBundle.loadString("assets/files/quran/$suraNumber.txt");
    versesList = content.split("\n");
    setState(() {});
  }
}
