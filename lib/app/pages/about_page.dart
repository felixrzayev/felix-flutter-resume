import 'package:felixrzayev/data/constants.dart';
import 'package:felixrzayev/app/widgets/common_widgets_titles.dart';
import 'package:felixrzayev/data/rep/inherited_data.dart';
import 'package:flutter/material.dart';

import '../../data/strings.dart';
import '../../model/data_model.dart';
import '../widgets/base_page.dart';
import '../widgets/common_layouts.dart';

class AboutPage extends StatelessWidget {
  AboutPage(GlobalKey key) : super(key: key);

  //----------------------------------------------------------------------------
  // BUILD
  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    DataModel data = InheritedData.of(context).data;

    return BasePage(
      child: LayoutBuilder(
        builder: (_, constrain) {
          final maxWidth = constrain.maxWidth;
          final isTabletSize = maxWidth > 500;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonPageTitle(aboutMe),
              SizedBox(height: 32),
              multiChildLayout(
                forTablet: isTabletSize,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data.about.into,
                          style: TextStyle(
                            fontSize: 18,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: 24),
                        LayoutBuilder(
                          builder: (_, constrains) => Wrap(
                            direction: Axis.horizontal,
                            children: data.about.highlights
                                .toList()
                                .map((e) => commonBulletPoint(e))
                                .toList(),
                          ),
                        ),
                        SizedBox(width: 36, height: 16),
                      ],
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
