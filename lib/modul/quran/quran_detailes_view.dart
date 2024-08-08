import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/modul/quran/quran.dart';

class QuranDetailesView extends StatefulWidget {
  const QuranDetailesView({super.key});

  static const String routeName = "QuranDetailes";

  @override
  State<QuranDetailesView> createState() => _QuranDetailesViewState();
}

class _QuranDetailesViewState extends State<QuranDetailesView> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as SuraData;
    var theme = Theme.of(context);
    if (content.isEmpty) loadData(data.suraNumber);
    return DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/bg3.png"))),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "إسلامي",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "سورة ${data.suraTitle}",
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.play_circle,
                      color: Color(0xff242424),
                      size: 27.2,
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

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:islami_app/modul/quran/quran.dart';

// class QuranDetailsView extends StatefulWidget {
//   static const String routeNames = "QuranDetails";

//   @override
//   State<QuranDetailsView> createState() => _QuranDetailsViewState();
// }

// class _QuranDetailsViewState extends State<QuranDetailsView> {
//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     var data = ModalRoute.of(context)?.settings.arguments as SuraData;
//     if (versesList.isEmpty) loadData(data.suraNumber);
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("اسلامي"),
//         ),
//         body: Container(
//           margin: EdgeInsets.only(
//             top: 10,
//             left: 30,
//             right: 30,
//             bottom: 80,
//           ),
//           padding: EdgeInsets.only(
//             top: 30,
//             left: 30,
//             right: 30,
//             bottom: 80,
//           ),
//           decoration: BoxDecoration(
//               color: const Color(0xFF141A2E),
//               borderRadius: BorderRadius.circular(25)),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "سوة${data.suraTitle}",
//                     style: theme.textTheme.bodyMedium?.copyWith(
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Icon(
//                     Icons.play_circle_fill_rounded,
//                     color: Colors.black,
//                   ),
//                 ],
//               ),
//               Divider(),
//               Expanded(
//                 child: ListView.builder(
//                   itemBuilder: (context, index) => Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: Text(
//                       "{${index + 1}${versesList[index]}",
//                       textAlign: TextAlign.center,
//                       style: theme.textTheme.bodySmall?.copyWith(
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   itemCount: versesList.length,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String content = "";
//   List<String> versesList = [];

//   Future<void> loadData(String suraNumber) async {
//     content = await rootBundle.loadString("assets/files/quran/$suraNumber.txt");
//     versesList = content.split("\n");
//     setState(() {});
//   }
// }
// //   String content = "";
// //   List<String> versesList = [];

// //   Future<void> loadData(String suraNumber) async {
// //     content = await rootBundle.loadString("assets/files/quran/$suraNumber.txt");
// //     versesList = content.split("\n");
// //     setState(() {});
// //   }
// // }
