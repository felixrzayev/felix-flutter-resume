import 'package:felixrzayev/app/widgets/common_widgets_titles.dart';
import 'package:flutter/material.dart';

import '../../data/rep/inherited_data.dart';
import '../../model/data_model.dart';
import '../widgets/base_page.dart';
import '../../data/strings.dart' as strings;

class MySkillPage extends StatelessWidget {
  MySkillPage(GlobalKey key) : super(key: key);

  //----------------------------------------------------------------------------
  // BUILD
  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    DataModel data = InheritedData.of(context).data;
    return BasePage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonPageTitle(strings.skills),
          SizedBox(height: 32),
          LayoutBuilder(
            builder: (_, constrain) {
              final maxWidth = constrain.maxWidth;
              final widthForTablet = 500;
              final skillWidth = maxWidth > widthForTablet
                  ? (maxWidth - 36) / 3
                  : (maxWidth - 24) / 2;
              return Wrap(
                spacing: 18,
                runSpacing: 18,
                children: data.skills
                    .map(
                      (skill) => SizedBox(
                        width: skillWidth,
                        child: commonBulletPoint(skill),
                      ),
                    )
                    .toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
