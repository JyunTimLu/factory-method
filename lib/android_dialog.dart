import 'package:factory_pattern/custom_dialog.dart';
import 'package:flutter/material.dart';

class AndroidDialog extends CustomDialog {
  @override
  Widget create(BuildContext context) {
    return AlertDialog(
      title: Text(
        getTitle(),
      ),
      content: Text("this is android dialog"),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("close"))
      ],
    );
  }

  @override
  String getTitle() {
    return "Android Dialog";
  }
}
