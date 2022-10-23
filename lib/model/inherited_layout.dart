import 'package:flutter/material.dart';

//TODO: Sizings for Desktop, Tablet, Mobile

class InheritedLayout extends InheritedWidget {
  const InheritedLayout({Key? key, required this.child, required this.isTablet})
      : super(key: key, child: child);

  final Widget child;

  final bool isTablet;

  static InheritedLayout of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedLayout>()!;
  }

  @override
  bool updateShouldNotify(InheritedLayout oldWidget) {
    return oldWidget.isTablet != isTablet;
  }
}
