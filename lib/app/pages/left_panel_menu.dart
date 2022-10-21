import 'package:felixrzayev/model/data.dart';
import 'package:felixrzayev/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/rep/inherited_data.dart';
import '../../data/strings.dart';
import '../../model/data_model.dart';
import '../widgets/common_buttons.dart';

class LeftPanelMenu extends StatelessWidget {
  final Function onTap;

  LeftPanelMenu(this.onTap);

  //----------------------------------------------------------------------------
  // BUILD
  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    DataModel data = InheritedData.of(context).data;
    return Card(
      color: mainColor,
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(context, data),
              SizedBox(height: 24),
              _buildListOfNavigationButtons(this.onTap),
              SizedBox(height: 24),
              _buildSocialButtonList(data),
              SizedBox(height: 24),
              //TODO: Delete or put your email
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  Data.EMAIL,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                  ),
                ),
              ),
              downloadAndHirebuttons(),
            ],
          ),
        ),
      ),
    );
  }

  //----------------------------------------------------------------------------
  // Header
  //----------------------------------------------------------------------------

  Widget _buildHeader(BuildContext context, DataModel data) {
    //TODO: Paddings
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 72,
            height: 72,
            //TODO: Avatar
            child: ClipRRect(
              child: Placeholder(),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 24),
        Text(data.name, style: h2TextStyle),
        SizedBox(height: 4),
        Text(
          data.subtitle,
          style: t1TextStyle,
        ),
      ],
    );
  }

  //----------------------------------------------------------------------------
  // List of Buttons
  //----------------------------------------------------------------------------

  Widget _buildListOfNavigationButtons(Function onTap) {
    List items = [
      [about, Icons.account_box],
      [skills, Icons.stacked_bar_chart],
      [education, Icons.book],
      [experience, Icons.work],
      [contactButton, Icons.contacts]
    ];

    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = items[index];
        return CommonMenuButton(
          title: item[0],
          icon: item[1],
          onTap: () {
            this.onTap(index);
          },
        );
      },
    );
  }

  //----------------------------------------------------------------------------
  // Social Network Buttons
  //----------------------------------------------------------------------------

  Widget _buildSocialButtonList(DataModel data) {
    List items = [
      [data.linkedIn, FontAwesomeIcons.linkedin],
      [data.instagram, FontAwesomeIcons.instagram],
      [data.github, FontAwesomeIcons.github],
      [data.twitter, FontAwesomeIcons.twitter],
      [data.telegran, FontAwesomeIcons.telegram],
    ];

    return SizedBox(
      height: 48,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildLinkingButton(
            url: item[0],
            iconData: item[1],
          );
        },
      ),
    );
  }

  Widget _buildLinkingButton({
    required IconData iconData,
    required String url,
  }) {
    return Container(
      width: 32,
      height: 32,
      margin: EdgeInsets.only(right: 12),
      child: FloatingActionButton(
        onPressed: () {
          //TODO: fixed urls
          // launch(url);
        },
        elevation: 2,
        backgroundColor: blackColor.withOpacity(0.8),
        child: Icon(
          iconData,
          color: backgroundColor,
          size: 16,
        ),
      ),
    );
  }

  //----------------------------------------------------------------------------
  // Resume button
  //----------------------------------------------------------------------------

  //TODO: add resume for download
  Widget downloadAndHirebuttons() {
    return CommonCallToActionButton(
      hoverColor: outlineColor,
      onPressed: () {},
      icon: Icons.file_download,
      text: resumeDownload,
      backgroundColor: outlineColor,
    );
  }
}
