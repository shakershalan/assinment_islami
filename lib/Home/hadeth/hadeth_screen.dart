import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/Home/hadeth/items_hadeth_details.dart';
import 'package:untitled/Home/quran/items_sura_details.dart';
import 'package:untitled/my_theme.dart';

import '../../providers/app_config_provider.dart';
import 'hadeth_tap.dart';
import 'package:provider/provider.dart';

class HadethScreen extends StatefulWidget {
  static const String routeName = 'hadeth_screen';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as Hadith;
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        provider.isDark()
            ? Image(
                image: AssetImage("assets/images/dark_background.png"),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill)
            : Image(
                image: AssetImage("assets/images/background.png"),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(arg.title),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.06,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            decoration: provider.isDark()
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: MyTheme.primaryDarkColor,
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: MyTheme.whiteColor,
                  ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemHadethDetails(content: arg.content[index]);
              },
              itemCount: arg.content.length,
            ),
          ),
        )
      ],
    );
  }
}
