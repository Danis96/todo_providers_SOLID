import 'package:flutter/material.dart';

Future<void> showMyDialog({
  BuildContext context,
  String title,
  String msg,
  Color color,
  Widget mainWidget,
  Widget action,
  double elevation,
  bool barrier,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrier,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        backgroundColor: color,
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Container(
                child:  mainWidget,
              )
            ],
          ),
        ),
        actions: <Widget>[
          action,
        ],
      );
    },
  );
}
