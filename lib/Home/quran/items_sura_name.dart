import 'package:flutter/material.dart';
import 'package:untitled/Home/quran/sura_screen.dart';
import 'package:provider/provider.dart';
import 'package:untitled/my_theme.dart';

import '../../providers/app_config_provider.dart';

class ItemSuraName extends StatefulWidget {
  String name;
  int index;

  ItemSuraName({required this.name, required this.index});

  @override
  State<ItemSuraName> createState() => _ItemSuraNameState();
}

class _ItemSuraNameState extends State<ItemSuraName> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraScreen.routeName,
            arguments: SuraDetailsArgs(name: widget.name, index: widget.index));
      },
      child: Text(widget.name,
          style: provider.isDark()
              ? Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: MyTheme.whiteColor)
              : Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center),
    );
  }
}
