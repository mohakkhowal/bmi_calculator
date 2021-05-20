import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'columnData.dart';
import 'reusableCard.dart';
import '../constants.dart';
import 'RoundIconButton.dart';
import 'BottomButton.dart';
import 'package:bmi_calculator/brain.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactiveCardColor;
  Color femaleColor = inactiveCardColor;
  int height = 169;
  var gender = 0;
  int weight = 69;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.stethoscope),
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = 1;
                        maleColor = activeCardColor;
                        femaleColor = inactiveCardColor;
                      });
                    },
                    colour: maleColor,
                    cardChild:
                        ColumnData(iconn: FontAwesomeIcons.male, text: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = 2;
                        maleColor = inactiveCardColor;
                        femaleColor = activeCardColor;
                      });
                    },
                    colour: femaleColor,
                    cardChild: ColumnData(
                        iconn: FontAwesomeIcons.female, text: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'HEIGHT',
                      style: labelTextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$height',
                          style: numberstyle,
                        ),
                        Text(
                          'cm',
                          style: labelTextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        trackHeight: 1,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                      ),
                      child: Slider(
                        // activeColor: Color(0xFFEB1555),
                        // inactiveColor: Color(0xFF111328),
                        value: height.toDouble(),
                        onChanged: (double newheight) {
                          setState(() {
                            height = newheight.round();
                          });
                        },
                        min: 120,
                        max: 220,
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextstyle,
                        ),
                        Text(
                          '$weight',
                          style: numberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icoo: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 15),
                            RoundIconButton(
                              icoo: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextstyle,
                        ),
                        Text(
                          '$age',
                          style: numberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icoo: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 15),
                            RoundIconButton(
                              icoo: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            txt: 'CALCULATE YOUR BMI',
            onPress: () {
              Brain b = new Brain(h: height,w: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(bmi: b.calculate(),result: b.getResult(),interpretation: b.getInterpretation(),colorrr: b.getColor(),);
              }));
            },
          ),
        ],
      ),
    );
  }
}
