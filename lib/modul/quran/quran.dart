// assets/images/qur2an_screen_logo.png

import 'package:flutter/material.dart';
import 'package:islami_app/modul/quran/quran_detailes_view.dart';
import 'package:islami_app/modul/quran/widgets/sura_title_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranView extends StatelessWidget {
  QuranView({super.key});

  final List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    var theme = Theme.of(context);
    return Stack(
      children: [
        Column(
          children: [
            const Center(
                child: Image(
                    image: AssetImage("assets/images/qur2an_screen_logo.png"))),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child:
                        Text(lang.suraNumber, style: theme.textTheme.bodyLarge),
                  ),
                ),
                Expanded(
                  child: Center(
                    child:
                        Text(lang.suraName, style: theme.textTheme.bodyLarge),
                  ),
                ),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 392,
                child: ListView.builder(
                  itemCount: suraNames.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, QuranDetailesView.routeName);
                      Navigator.pushNamed(context, QuranDetailesView.routeName,
                          arguments: SuraData(
                            suraTitle: suraNames[index],
                            suraNumber: (index + 1).toString(),
                          ));
                    },
                    child: SuraTitleWidget(
                        data: SuraData(
                      suraTitle: suraNames[index],
                      suraNumber: (index + 1).toString(),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 -
              1.5, // divide screen - 3 /2
          top: 6, // MediaQuery.of(context).size.height / 4 + 12 ,
          bottom: 0,
          child: const VerticalDivider(
            indent: 230,
          ),
        ),
      ],
    );
  }
}

class SuraData {
  final String suraTitle;
  final String suraNumber;

  SuraData({required this.suraNumber, required this.suraTitle});
}
