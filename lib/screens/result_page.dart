import 'package:bmi_calculator/screens/BottomButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage(
      {@required this.bmi,
      @required this.interpretation,
      @required this.result,
      @required this.colorrr});
  final String bmi, interpretation, result;
  final Color colorrr;

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  String msgg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.result.toUpperCase(),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: widget.colorrr),
                  ),
                  Text(
                    '${widget.bmi}',
                    style: bmiTextStyle,
                  ),
                  Text(
                    'Normal BMI range:\n18.5 - 25 kg/m²',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF8D8E98),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      '${widget.interpretation}',
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                      icon: Icon(FontAwesomeIcons.shareAlt),
                      onPressed: () {
                        setState(() {
                          msgg =
                              'I just calculated by BMI using this awesome app!\nMy BMI is ${widget.bmi} ,which means my body mass index is ${widget.result}\nThis app\'s suggestion to me was \"${widget.interpretation}\"';
                        });
                        setState(() {
                          print('works');
                          print(msgg);
                          FlutterShareMe().shareToSystem(msg: msgg);
                        });
                      })
                ],
              ),
            ),
          ),
          BottomButton(
              onPress: () {
                Navigator.pop(context);
              },
              txt: 'RE-CALCULATE YOUR BMI'),
        ],
      ),
    );
  }
}
