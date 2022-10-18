import 'package:felixrzayev/model/data.dart';
import 'package:felixrzayev/data/constants.dart';
import 'package:flutter/material.dart';

import 'base_page.dart';

class AppTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: mainColor,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            SizedBox(width: 16),
            SizedBox(
              width: 32,
              height: 32,
              child: CircleAvatar(
                backgroundImage: AssetImage(Data.AVATAR),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(width: 16),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "${Data.NAME}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: ' ●',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: subColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
