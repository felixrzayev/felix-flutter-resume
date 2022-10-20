import 'package:felixrzayev/app/widgets/common_widgets_titles.dart';
import 'package:felixrzayev/app/widgets/animated_text.dart';
import 'package:felixrzayev/app/widgets/react_button.dart';
import 'package:flutter/material.dart';

import '../../data/rep/inherited_data.dart';
import '../../model/data_model.dart';
import '../widgets/base_page.dart';
import '../../data/constants.dart';
import '../widgets/common_layouts.dart';

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
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(exp.image),
            ),
          ),
          Flexible(
            child: Column(
              children: [
                multiChildLayout(
                  forTablet: isTablet,
                  rowAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(exp.title),
                    Text(exp.company),
                  ],
                ),
                _buildRow(
                  isTablet: isTablet,
                  children: [
                    Text("${exp.startDate} - ${exp.endDate}"),
                    Text(exp.location),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow({
    required List<Widget> children,
    required bool isTablet,
  }) {
    if (isTablet) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: children,
      );
    }
    return Column(
      children: children,
    );
  }
}
