import 'package:flutter/material.dart';
import 'package:untitled/Home/hadeth/hadeth_tap.dart';
import 'package:untitled/Home/quran/quran_tap.dart';
import 'package:untitled/Home/radio/radio_tap.dart';
import 'package:untitled/Home/sebha/sebha_tap.dart';
import 'package:untitled/Home/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDark()
            ? Image(
                image: AssetImage("assets/images/dark_background.png"),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image(
                image: AssetImage("assets/images/background.png"),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                  label: AppLocalizations.of(context)!.radio,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_hades.png')),
                  label: AppLocalizations.of(context)!.hadith,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings,
                )
              ],
            ),
          ),
          body: taps[selectedIndex],
        )
      ],
    );
  }

  List<Widget> taps = [
    RadioTap(),
    SebhaTap(),
    HadethTap(),
    QuranTap(),
    SettingTap()
  ];
}
