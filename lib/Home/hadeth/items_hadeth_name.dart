import 'package:flutter/material.dart';
import 'package:untitled/my_theme.dart';

import '../../providers/app_config_provider.dart';
import '../quran/sura_screen.dart';
import 'hadeth_screen.dart';
import 'hadeth_tap.dart';
import 'package:provider/provider.dart';

class ItemHadethName extends StatelessWidget {
  Hadith hadith;

  ItemHadethName({required this.hadith});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethScreen.routeName, arguments: hadith);
      },
      child: Text(
        hadith.title,
        style: provider.isDark()
            ? Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: MyTheme.whiteColor)
            : Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
