import 'package:flutter/material.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/common/common_button.dart';

void showCommonDialog(
    {@required BuildContext context,
    String text = '',
    Function onButtonPressed}) {
  slideDialog.showSlideDialog<Widget>(
    context: context,
    child: dialogVisual(text: text, onButtonPressed: onButtonPressed),
    barrierColor: Colors.white.withOpacity(0.7),
    pillColor: ColorHelper.mainPurple.color,
    backgroundColor: ColorHelper.todoWhite.color,
  );
}

Widget dialogVisual({
  @required String text,
  @required Function onButtonPressed,
}) {
  return Container(
    height: 400,
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        /// image error
        Container(
          child: Image.asset(
            'assets/error.png',
            width: 80,
            height: 80,
          ),
        ),

        /// error text
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
          ),
        ),

        /// button to exit
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          width: 300,
          child: commonButton(
            onPressed: () => onButtonPressed(),
            text: 'OK',
          ),
        ),
      ],
    ),
  );
}
