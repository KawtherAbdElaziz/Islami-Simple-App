import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/modul/hadeth/hadith.dart';

class HadithDetailes extends StatefulWidget {
  const HadithDetailes({super.key});

  static const String routeName = "HadithDetailes";

  @override
  State<HadithDetailes> createState() => _HadithDetailesState();
}

class _HadithDetailesState extends State<HadithDetailes> {
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    var data = ModalRoute
        .of(context)
        ?.settings
        .arguments as HadithData;
    var theme = Theme.of(context);
    return DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/bg3.png"))),
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
              color: const Color(0xffF8F8F8).withOpacity(0.8),
            ),
            child: Column(
              children: [
                Text(
                  data.title,
                  style: theme.textTheme.bodyMedium,
                ),
                const Divider(
                  thickness: 1,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        data.bodyContent,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: theme.textTheme.bodySmall?.copyWith(
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
