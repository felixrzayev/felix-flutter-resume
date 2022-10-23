import 'package:felixrzayev/data/constants.dart';
import 'package:flutter/material.dart';

import '../../data/rep/inherited_data.dart';
import '../../model/data_model.dart';
import 'base_page.dart';

class AppTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataModel data = InheritedData.of(context).data;

    return BasePage(
      color: mainColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: blackColor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            SizedBox(width: 16),
            Text(
              "${data.name}",
              style: h3TextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
