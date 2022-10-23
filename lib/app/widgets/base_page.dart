import 'package:flutter/material.dart';

import '../../data/constants.dart';
import '../../model/inherited_layout.dart';

class BasePage extends StatelessWidget {
  final Color color;
  final Widget? child;

  BasePage({
    this.color = backgroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    bool isTablet = InheritedLayout.of(context).isTablet;

    return Container(
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: isTablet ? pageContentPadding : mobileContentPadding,
          child: child,
        ),
      ),
    );
  }
}
