import 'package:flutter/material.dart';
import 'package:untitled/Home/hadeth/hadeth_screen.dart';
import 'package:untitled/Home/home_screen.dart';
import 'package:untitled/Home/quran/sura_screen.dart';
import 'package:untitled/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return AppConfigProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraScreen.routeName: (context) => SuraScreen(),
        HadethScreen.routeName: (context) => HadethScreen(),
        HadethScreen.routeName: (context) => HadethScreen(),
      },
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.appMode,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
