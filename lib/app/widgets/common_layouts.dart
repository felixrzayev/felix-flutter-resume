import 'package:flutter/material.dart';

Widget multiChildLayout(
    {required bool forTablet,
    List<Widget>? children,
    MainAxisAlignment rowAlignment = MainAxisAlignment.start}) {
  Widget result;
  if (!forTablet) {
    result = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children!,
    );
  } else {
    result = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: rowAlignment,
      children: children!,
    );
  }
  return result;
}
