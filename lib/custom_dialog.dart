import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class CustomDialog {
  String getTitle();
  Widget create(BuildContext context);

  Future<void> show(BuildContext context) async {
    var dialog = create(context);
    return showDialog(context: context, builder: (context) => dialog);
  }
}
