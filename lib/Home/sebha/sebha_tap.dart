import 'package:flutter/material.dart';
import 'package:untitled/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  double turns = 0;
  String text = '';
  List<String> words = ['الحمدلله', 'سبحان الله', 'الله اكبر'];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Center(
          child: InkWell(
            onTap: () {
              turns += 1;
              if (turns == 99) {
                turns = 0;
              }
              setState(() {});
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.08,
                  ),
                  child: AnimatedRotation(
                    turns: turns,
                    duration: Duration(seconds: 2),
                    child: provider.isDark()
                        ? Image.asset("assets/images/dark_body_sebha.png")
                        : Image.asset("assets/images/icon_sebha.png"),
                  ),
                ),
                provider.isDark()
                    ? Image.asset("assets/images/dark_head_sebha.png")
                    : Image(image: AssetImage("assets/images/head_sebha.png")),
              ],
            ),
          ),
        ),
        Text(AppLocalizations.of(context)!.number_altasbhat,
            style: provider.isDark()
                ? Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: MyTheme.whiteColor)
                : Theme.of(context).textTheme.titleMedium),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).primaryColor),
              child: Text("$turns",
                  style: provider.isDark()
                      ? Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: MyTheme.whiteColor)
                      : Theme.of(context).textTheme.titleSmall),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: provider.isDark()
                  ? BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).primaryColor)
                      .copyWith(color: MyTheme.yellowColor)
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).primaryColor),
              child: Text(contener(words, turns)),
            ),
          ),
        )
      ],
    );
  }

  String contener(List<String> words, double turns) {
    if (turns == 0) {
      text = words[0];
    } else if (turns == 34) {
      text = words[1];
    } else if (turns == 67) {
      text = words[2];
    }
    return text;
  }
}
