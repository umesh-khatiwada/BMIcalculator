//import 'dart:js_util';

import 'package:BMI/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container_c.dart';
import 'icon_label.dart';
import 'constants.dart';
import 'brain.dart';
import 'bottom_button.dart';

enum GenderType { male, female }

class Inputpage extends StatefulWidget {
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  GenderType selectedGender;
  int height = 180;
  int weight = 50;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0A0D22),
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
          backgroundColor: Color(0xFF0A0D22),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //1.
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Common(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      colour: selectedGender == GenderType.male
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardChild: Column(children: [
                        IconContent(
                          icon: FontAwesomeIcons.mars,
                        ),
                        SizedBox(height: 10.00),
                        LabelUp(
                          label: 'Male',
                        )
                      ]),
                    )),
                    Expanded(
                      child: Common(
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.female;
                          });
                        },
                        colour: selectedGender == GenderType.female
                            ? kactiveCardColor
                            : kinactiveCardColor,
                        cardChild: Column(
                          children: [
                            IconContent(
                              icon: FontAwesomeIcons.venus,
                            ),
                            SizedBox(height: 10.00),
                            LabelUp(
                              label: 'Female',
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //2.
              Expanded(
                child: Common(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: kLabelText),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(height.toString(), style: kLabelNumber),
                          Text('cm', style: kLabelText),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF888993),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0)),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 200,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                                
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),

              //3.
              Expanded(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: Common(
                      colour: kactiveCardColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: kLabelText),
                            Text(
                              weight.toString(),
                              style: kLabelNumber,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      }),
                                ]),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: Common(
                      colour: kactiveCardColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: kLabelText),
                            Text(
                              age.toString(),
                              style: kLabelNumber,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      }),
                                ]),
                          ]),
                    ),
                  ),
                ]),
              ),

              BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
                  

              Navigator.push(
                context,
                MaterialPageRoute(
                  
                  builder: (context) => ResultsPage(
                              bmiResult: calc.calculatorBMI(),
                            interpretation: calc.getInterpretation(),
                            
                            resultText: calc.getResult(),
                            )),
                  );
                },
                
              ),
            ]));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      elevation: 6,
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
    );
  }
}
