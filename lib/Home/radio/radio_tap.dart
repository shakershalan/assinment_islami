import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/my_theme.dart';
import 'package:untitled/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.1,
          horizontal: MediaQuery.of(context).size.width * 0.06),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: AssetImage('assets/images/radio_image.png')),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context)!.holy_quran,
                style: provider.isDark()
                    ? Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: MyTheme.whiteColor)
                    : Theme.of(context).textTheme.titleMedium),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: provider.isDark()
                ? Image.asset("assets/images/dark_icon.png")
                : Image(image: AssetImage('assets/images/icon_image.png')),
          ),
        ],
      ),
    );
  }
}
