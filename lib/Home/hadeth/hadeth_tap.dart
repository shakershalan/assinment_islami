import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/my_theme.dart';
import '../../providers/app_config_provider.dart';
import 'items_hadeth_name.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadith> hadithList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (hadithList.isEmpty) {
      loadFileHadith();
    }
    return Column(
      children: [
        Center(child: Image(image: AssetImage('assets/images/icon_hadeh.png'))),
        Divider(
          color: provider.isDark()
              ? MyTheme.yellowColor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.hadith_name,
            style: provider.isDark()
                ? Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: MyTheme.whiteColor)
                : Theme.of(context).textTheme.titleMedium),
        Divider(
          color: provider.isDark()
              ? MyTheme.yellowColor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        hadithList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => ItemHadethName(
                          hadith: hadithList[index],
                        ),
                    separatorBuilder: (context, index) => Divider(
                          color: provider.isDark()
                              ? MyTheme.yellowColor
                              : Theme.of(context).primaryColor,
                          thickness: 2,
                        ),
                    itemCount: hadithList.length),
              )
      ],
    );
  }

  Future<void> loadFileHadith() async {
    String ahadethContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethList = ahadethContent.split('#\r\n');
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> ahadethLines = ahadethList[i].split('\n');
      String title = ahadethLines[0];
      ahadethLines.removeAt(0);
      Hadith hadith = Hadith(title: title, content: ahadethLines);
      hadithList.add(hadith);
      setState(() {});
    }
  }
}

class Hadith {
  String title;
  List<String> content;

  Hadith({required this.title, required this.content});
}
