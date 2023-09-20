import 'package:flutter/material.dart';
import 'package:untitled/Home/hadeth/hadeth_tap.dart';
import 'package:untitled/Home/quran/quran_tap.dart';
import 'package:untitled/Home/radio/radio_tap.dart';
import 'package:untitled/Home/sebha/sebha_tap.dart';
import 'package:untitled/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage("assets/images/background.png"),
          width: double.infinity, height: double.infinity, fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(
            title: Text("Islami", style: Theme
                .of(context)
                .textTheme
                .titleLarge,),


          ),
          bottomNavigationBar: Theme(

            data: Theme.of(context).copyWith(
              canvasColor: Theme
                  .of(context)
                  .primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {

                });
              },

              items: [
                BottomNavigationBarItem(icon: ImageIcon(
                    AssetImage('assets/images/icon_radio.png')

                ), label: 'radio',
                ),
                BottomNavigationBarItem(icon: ImageIcon(
                    AssetImage('assets/images/icon_sebha.png')
                ),
                  label: 'sebha',),
                BottomNavigationBarItem(icon: ImageIcon(
                    AssetImage('assets/images/icon_hades.png')
                ),
                  label: 'hades',),
                BottomNavigationBarItem(icon: ImageIcon(
                    AssetImage('assets/images/icon_quran.png')
                ), label: 'quran',)
              ],

            ),
          ),
          body: taps[selectedIndex],
        )
      ],
    );
  }

  List<Widget>taps = [
    RadioTap(), SebhaTap(), HadethTap(), QuranTap()
  ];
}
