import 'package:flutter/material.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.onPress, @required this.txt});
  final Function onPress;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
        color: Color(0xFFEB1555),
        child: Center(
          child: Text(
            '$txt',
            style: largeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
