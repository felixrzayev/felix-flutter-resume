import 'package:felixrzayev/app/widgets/common_widgets_titles.dart';
import 'package:flutter/material.dart';

import '../../data/rep/inherited_data.dart';
import '../../model/data_model.dart';
import '../widgets/base_page.dart';
import '../../data/constants.dart';

class CompanyPage extends StatefulWidget {
  CompanyPage(GlobalKey key) : super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  //----------------------------------------------------------------------------
  // BUILD
  //----------------------------------------------------------------------------

  Widget build(BuildContext context) {
    DataModel data = InheritedData.of(context).data;

    return BasePage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonPageTitle("Experience"),
          SizedBox(height: 32),
          _buildCompanies(data),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  //----------------------------------------------------------------------------
  // Build - List of Companies
  //----------------------------------------------------------------------------

  Widget _buildCompanies(DataModel data) {
    return LayoutBuilder(
      builder: (_, constaints) {
        final maxWidth = constaints.maxWidth;
        final isTabletSize = maxWidth > 500;
        return Wrap(
          children: data.experience
              .map(
                (e) => _buildExperience(e, isTabletSize),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildExperience(Experience exp, bool isTablet) {
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
              child: Image.network(exp.image),
            ),
          ),
          SizedBox(
            width: 15,
            height: 50,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLayout(
                  forTablet: isTablet,
                  children: [
                    Text(
                      exp.title,
                      style: h4TextStyle,
                    ),
                    Text(
                      exp.company,
                      style: t1TextStyle,
                    ),
                  ],
                ),
                _buildLayout(
                  forTablet: isTablet,
                  children: [
                    Text(
                      exp.location,
                      style: t1TextStyle,
                    ),
                    Text(
                      "${exp.startDate} - ${exp.endDate}",
                      style: t1TextStyle,
                    ),
                  ],
                ),
                //TODO: Paddings
                SizedBox(height: 12),
                LayoutBuilder(
                  builder: (_, __) => Wrap(
                    children: exp.highlights
                        .map((e) => commonBulletPoint(
                              e,
                              rowAlignment: CrossAxisAlignment.start,
                              style: t2TextStyle,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayout({
    required List<Widget> children,
    required bool forTablet,
  }) {
    if (forTablet) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
