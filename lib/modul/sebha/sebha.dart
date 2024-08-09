import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:islami_app/core/settings_provider.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var provider = Provider.of<SettingsProvider>(context);

    var lang = AppLocalizations.of(context)!;
    return Center(
      child: Text(lang.sephaview, style: theme.textTheme.titleLarge),
    );
  }
}
