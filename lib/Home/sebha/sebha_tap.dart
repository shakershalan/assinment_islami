import 'package:flutter/material.dart';

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
                    child: Image.asset("assets/images/icon_sebha.png"),
                  ),
                ),
                Image(image: AssetImage("assets/images/head_sebha.png")),
              ],
            ),
          ),
        ),
        Text(
          "عدد التسبيحات",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).primaryColor),
              child: Text("$turns"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
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
