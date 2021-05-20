import 'package:flutter/material.dart';
import '../constants.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icoo,@required this.onpress});
  final icoo;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icoo),
      onPressed: onpress,
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
      fillColor: buttonColor,
    );
  }
}
