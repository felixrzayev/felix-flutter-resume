import 'package:flutter/material.dart';

import '../../data/constants.dart';

class BasePage extends StatelessWidget {
  // TODO: Use standard color
  final Color color;
  final Widget? child;

  BasePage({
    this.color = Colors.white,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: pageContentPadding,
          child: child,
        ),
      ),
    );
  }
}
