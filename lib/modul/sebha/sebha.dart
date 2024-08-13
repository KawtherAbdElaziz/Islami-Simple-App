import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/core/settings_provider.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  double angle = 0;
  int count = 0;
  int index = 0;
  List<String> azkar = ["سبحان الله", "الله اكبر"];
  bool _isRotated = false;

  void _rotateImage() {
    setState(() {
      _isRotated = !_isRotated;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);

    var lang = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Center(
                  child: Image.asset(
                    provider.getSephaP1Image(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75),
                child: Center(
                  child: Transform.rotate(
                    angle: angle,
                    child: GestureDetector(
                        onTap: () {
                          ontap();
                        },
                        //  _rotateImage,
                        child: Image.asset(
                          provider.getSephaP2Image(),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text("عدد التسبيحات"),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 69,
            height: 81,
            decoration: BoxDecoration(
                color: const Color(0xffB7935F).withOpacity(.57),
                borderRadius: BorderRadius.circular(25)),
            child: Center(child: Text("$count")),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 137,
            height: 51,
            decoration: BoxDecoration(
                color: const Color(0xffB7935F),
                borderRadius: BorderRadius.circular(25)),
            child: Center(
                child: Text(
              "${azkar[index]}",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          )
        ],
      ),
    );
  }

  ontap() {
    count++;
    if (count % 33 == 0) {
      index++;
      count++;
      count = 0;
    }
    if (index == azkar.length) {
      index = 0;
    }
    angle += 360 / 4;
    setState(() {});
  }
}
