import 'package:flutter/material.dart';

import '../../data/constants.dart';
import '../../data/rep/inherited_data.dart';
import '../../data/strings.dart';
import '../../model/data_model.dart';
import '../widgets/base_page.dart';
import '../widgets/common_widgets_titles.dart';

class EducationPage extends StatelessWidget {
  EducationPage(GlobalKey key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataModel data = InheritedData.of(context).data;

    return BasePage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonPageTitle(education),
          SizedBox(height: 32),
          LayoutBuilder(
            builder: (_, constrains) => Wrap(
              direction: Axis.horizontal,
              children: data.education.map((e) => _buildUni(e)).toList(),
            ),
          ),
          greyLine(context, pad: 24),
          commonBulletPoint(languages, style: header2BoldTextStyle),
          _buildLanguages(data.languages),
          greyLine(context, pad: 24),
          commonBulletPoint(certification, style: header2BoldTextStyle),
          LayoutBuilder(
            builder: (_, __) => Wrap(
              children:
                  data.certification.map((e) => _buildCertsRow(e)).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUni(Education education) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(education.image),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                commonBulletPoint(
                  education.degree,
                  style: header2BoldTextStyle,
                  color: Colors.transparent,
                ),
                commonBulletPoint(
                  "${education.university}, ${education.location}",
                  style: header2TextStyle,
                  color: Colors.transparent,
                ),
                commonBulletPoint(
                  "${education.startDate} - ${education.endDate}",
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguages(List<Language> langs) {
    return LayoutBuilder(
      builder: (_, constrain) {
        final maxWidth = constrain.maxWidth;
        final widthForTablet = 500;
        final skillWidth = maxWidth / 3;
        // maxWidth > widthForTablet ? (maxWidth - 24) / 2 : maxWidth;
        return Wrap(
          // spacing: 3,
          // runSpacing: 3,
          children: langs
              .map(
                (lang) => SizedBox(
                  width: skillWidth,
                  child: commonBulletPoint(
                    "${lang.language} - ${lang.level}",
                    color: Colors.transparent,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildCertsRow(Certification cert) {
    return Column(
      children: [
        commonBulletPoint(
          cert.title,
          style: header3BoldTextStyle,
          color: Colors.transparent,
        ),
        commonBulletPoint(
          "${cert.institution}, ${cert.date}",
          color: Colors.transparent,
        ),
      ],
    );
  }
}
