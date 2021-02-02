import 'package:flutter/material.dart';
import 'package:BMI/input_page.dart';
//import 'result_page.dart';

void main() => runApp(BMIcalculator());

class BMIcalculator extends StatelessWidget {
  const BMIcalculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor:Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21)
      ),
      home: Inputpage(),
      routes: {
        //'/result': (context) =>result(),

      },
    );
  }
}