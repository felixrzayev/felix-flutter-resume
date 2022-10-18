import 'package:felixrzayev/model/data_model.dart';
import 'package:flutter/material.dart';

class InheritedData extends InheritedWidget {
  const InheritedData({Key? key, required this.child, required this.data})
      : super(key: key, child: child);

  final Widget child;

  final DataModel data;

  static InheritedData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedData>()!;
  }

  @override
  bool updateShouldNotify(InheritedData oldWidget) {
    return oldWidget.data != data;
  }
}
