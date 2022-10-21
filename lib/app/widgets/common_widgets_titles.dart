import 'package:flutter/material.dart';

import '../../data/constants.dart';

class CommonPageTitle extends StatelessWidget {
  final String title;

  CommonPageTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: h1TextStyle,
        ),
        // SizedBox(height: 12),
        greyLine(context),
      ],
    );
  }
}

Widget commonBulletPoint(
  String text, {
  TextStyle style = t1TextStyle,
  Color color = outlineColor,
  CrossAxisAlignment rowAlignment = CrossAxisAlignment.center,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      crossAxisAlignment: rowAlignment,
      children: [
        Text(
          '\u2022',
          style: TextStyle(
            fontSize: 18,
            color: color,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            child: Text(
              text,
              textAlign: TextAlign.left,
              softWrap: true,
              style: style,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget greyLine(BuildContext context,
    {double padBottom = 0, double padTop = 12}) {
  return Padding(
    padding: EdgeInsets.only(bottom: padBottom, top: padTop),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 2,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
