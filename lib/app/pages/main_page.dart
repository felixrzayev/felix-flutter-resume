import 'package:felixrzayev/app/pages/contact_page.dart';
import 'package:felixrzayev/app/pages/left_panel_menu.dart';
import 'package:felixrzayev/app/widgets/mobile_app_bar.dart';
import 'package:felixrzayev/model/inherited_layout.dart';
import 'package:flutter/material.dart';

import 'about_page.dart';
import 'companies_page.dart';
import 'education_page.dart';
import 'skills_page.dart';
import '../../data/constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState>? _scaffoldKey = GlobalKey<ScaffoldState>();

  void _downloadCV() {
    // launch(Data.CV_URL);
  }

  Widget pagePadding() => const SizedBox(height: pagePaddingSize);

  final keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  //----------------------------------------------------------------------------
  // BUILD
  //----------------------------------------------------------------------------

  //TODO: Use Inherited widget for layouts
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrain) {
        return InheritedLayout(
          isTablet: constrain.maxWidth >= minTaletSize,
          child: _childLayout(constrain.maxWidth >= minTaletSize),
        );
      },
    );
  }

  Widget _childLayout(bool isTablet) {
    if (isTablet) {
      return _buildTabletBody();
    }
    return _buildPhoneBody();
  }

  //----------------------------------------------------------------------------
  // Build for Tablets or PCs
  //----------------------------------------------------------------------------

  Widget _buildTabletBody() {
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // MaxWidth - 1160 pixels
          LimitedBox(
            maxWidth: 284,
            child: _buildNavigation(true),
          ),
          SizedBox(width: 24),
          LimitedBox(
            maxWidth: 852,
            child: _buildListDetail(true),
          )
        ],
      ),
    );
  }

  //----------------------------------------------------------------------------
  // Build for Phones
  //----------------------------------------------------------------------------

  Widget _buildPhoneBody() {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: _buildListDetail(false),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Drawer(
          child: _buildNavigation(false),
        ),
      ),
    );
  }

  //----------------------------------------------------------------------------
  // Main information list
  //----------------------------------------------------------------------------

  Widget _buildListDetail(bool forTablet) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: topPaddingSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Visibility(visible: !forTablet, child: AppTabBar()),
          AboutPage(keys[0]),
          pagePadding(),
          MySkillPage(keys[1]),
          pagePadding(),
          EducationPage(keys[2]),
          pagePadding(),
          CompanyPage(keys[3]),
          pagePadding(),
          GetInTouchPage(keys[4]),
        ],
      ),
    );
  }

  //----------------------------------------------------------------------------
  // Navigation methods
  //----------------------------------------------------------------------------

  void scrollToIndex(int index) {
    Scrollable.ensureVisible(
      keys[index].currentContext!,
      duration: Duration(milliseconds: 500),
    );
    if (_scaffoldKey!.currentState!.isDrawerOpen) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildNavigation(bool forTablet) {
    return Padding(
      padding: EdgeInsets.only(top: forTablet ? topPaddingSize : 0),
      child: LeftPanelMenu((index) {
        scrollToIndex(index);
      }),
    );
  }
}
