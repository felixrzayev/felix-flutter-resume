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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 12),
        greyLine(context),
      ],
    );
  }
}

Widget commonBulletPoint(
  String text, {
  TextStyle style = bulletPointTextStyle,
  Color color = Colors.black,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\u2022',
          style: TextStyle(
            fontSize: 16,
            height: 1.55,
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

Widget greyLine(BuildContext context, {double pad = 0}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: pad),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 2,
      decoration: BoxDecoration(
        // TODO: use standard color
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
