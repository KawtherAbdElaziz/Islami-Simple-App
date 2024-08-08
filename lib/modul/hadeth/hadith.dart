import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/modul/hadeth/widget/hadith_detailes.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    if (hadithDataList.isEmpty) {
      loadHadithData();
    }
    return Column(
      children: [
        const Center(
            child: Image(
              image: AssetImage(
                "assets/images/hadith_header.png",
              ),
              width: 312,
              height: 219,
            )),
        const Divider(),
        Text(
          lang.alahadith,
          style: theme.textTheme.bodyMedium,
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Bounceable(
                duration: const Duration(milliseconds: 1),
                onTap: () {
                  Navigator.pushNamed(context, HadithDetailes.routeName,
                      arguments: hadithDataList[index]);
                },
                child: Center(
                  child: Text(
                    hadithDataList[index].title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.8,
                    ),
                  ),
                ),
              );
            },
            itemCount: hadithDataList.length,
          ),
        )
      ],
    );
  }

  Future<void> loadHadithData() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadithDataList = content.split("#");
    // OR
    // List<String> allHadithDataList = content.trim().split("#");
    // List<String> allHadithDataList = content.split("#\r");,k

    for (int i = 0; i < allHadithDataList.length; i++) {
      String singleHadithData = allHadithDataList[i].trim();
      int indexLength = singleHadithData.indexOf("\n");
      // if (indexLength == -1) {
      //   indexLength = singleHadithData.length; // Handle no newline case
      // }
      String title = singleHadithData.substring(0, indexLength);
      String bodyContent = singleHadithData.substring(indexLength + 1);
      HadithData hadithData =
      HadithData(title: title, bodyContent: bodyContent);
      hadithDataList.add(hadithData);
    }
    setState(() {});
  }
}

class HadithData {
  final String title;
  final String bodyContent;

  HadithData({required this.title, required this.bodyContent});
}
