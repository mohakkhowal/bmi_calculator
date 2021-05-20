import 'package:flutter/material.dart';
import '../constants.dart';
class ColumnData extends StatelessWidget {
  ColumnData({@required this.iconn, @required this.text});
  final iconn;
  final text;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(iconn, size: 80),
      SizedBox(
        height: 15,
      ),
      Text(
        '$text',
        style: labelTextstyle,
      ),
    ], mainAxisAlignment: MainAxisAlignment.center);
  }
}
