// import 'package:flutter/material.dart';

// import 'menu_button.dart';

import 'package:flutter/material.dart';

class CommonMenuButton extends StatelessWidget {
  CommonMenuButton(
      {required this.icon, required this.onTap, required this.title});

  final String title;
  final IconData icon;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //TODO: Button with hover color and focused color
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap as void Function(),
      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 6),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black54,
              size: 18,
            ),
            SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
