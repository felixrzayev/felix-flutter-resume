import 'package:felixrzayev/model/data.dart';
import 'package:felixrzayev/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/strings.dart';
import '../widgets/common_navigation_button.dart';

class LeftPanelMenu extends StatelessWidget {
  final Function onTap;

  LeftPanelMenu(this.onTap);

  //----------------------------------------------------------------------------
  // BUILD
  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return _buildNavigation();
  }

  Widget _buildLinkingButton(IconData iconData, String url) {
    return Container(
      width: 32,
      height: 32,
      margin: EdgeInsets.only(right: 12),
      child: FloatingActionButton(
        onPressed: () {
          // launch(url);
        },
        elevation: 2,
        backgroundColor: subColor,
        child: Icon(
          iconData,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildNavigation() {
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
            children: <Widget>[
              SizedBox(
                width: 64,
                height: 64,
                child: CircleAvatar(
                  backgroundImage: AssetImage(Data.AVATAR),
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "${Data.NAME}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    TextSpan(
                      text: ' ●',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: subColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Mobile developer",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 48),
              // TODO: use builder here instead of calling button 4 times
              CommonMenuButton(
                  title: about,
                  icon: Icons.account_box,
                  onTap: () {
                    this.onTap(0);
                  }),
              CommonMenuButton(
                  title: skills,
                  icon: Icons.stacked_bar_chart,
                  onTap: () {
                    this.onTap(1);
                  }),
              CommonMenuButton(
                  title: education,
                  icon: Icons.book,
                  onTap: () {
                    this.onTap(2);
                  }),
              CommonMenuButton(
                  title: experience,
                  icon: Icons.work,
                  onTap: () {
                    this.onTap(3);
                  }),
              CommonMenuButton(
                  title: contactButton,
                  icon: Icons.contacts,
                  onTap: () {
                    this.onTap(4);
                  }),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildLinkingButton(
                    FontAwesomeIcons.facebookF,
                    Data.FACEBOOK_URL,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.instagram,
                    Data.INSTAGRAM_URL,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.githubAlt,
                    Data.GITHUB_URL,
                  ),
                  _buildLinkingButton(
                    FontAwesomeIcons.linkedinIn,
                    Data.LINKEDIN_URL,
                  ),
                ],
              ),
              SizedBox(height: 32),
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

  Widget downloadAndHirebuttons() {
    return Wrap(
      runSpacing: 12,
      spacing: 12,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: <Widget>[
        MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          // onPressed: downloadCV as void Function()?,
          onPressed: () {},
          color: subColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.file_download,
                color: Colors.white,
                size: 16,
              ),
              SizedBox(width: 6),
              Text(
                "Download my CV",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
