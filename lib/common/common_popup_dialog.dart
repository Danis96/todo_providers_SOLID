import 'package:flutter/material.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:todo/app/models/task_model.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/app/utils/boolean_extensions.dart';
import 'package:todo/app/utils/size_config.dart';
import 'package:todo/common/common_button.dart';
import 'package:todo/common/common_empty_container.dart';

void showCommonDialog({
  @required BuildContext context,
  String text = '',
  @required Function onButtonPressed,
  @required String image,
}) {
  slideDialog.showSlideDialog<Widget>(
    context: context,
    child: dialogVisual(
        text: text, onButtonPressed: onButtonPressed, image: image),
    barrierColor: Colors.white.withOpacity(0.7),
    pillColor: ColorHelper.mainPurple.color,
    backgroundColor: ColorHelper.todoWhite.color,
  );
}

Widget dialogVisual({
  @required String text,
  @required Function onButtonPressed,
  @required String image,
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
            image,
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

void showDetailsDialog({
  @required BuildContext context,
  @required TaskModel model,
  @required Function onLeftButtonPressed,
  @required Function onRightButtonPressed,
  @required String image,
}) {
  slideDialog.showSlideDialog<Widget>(
    context: context,
    child: detailsVisual(
      model: model,
      image: image,
      onLeftButtonPressed: onLeftButtonPressed,
      onRightButtonPressed: onRightButtonPressed,
    ),
    barrierColor: Colors.white.withOpacity(0.7),
    pillColor: ColorHelper.mainPurple.color,
    backgroundColor: ColorHelper.todoWhite.color,
  );
}

Widget detailsVisual({
  @required TaskModel model,
  @required Function onLeftButtonPressed,
  @required Function onRightButtonPressed,
  @required String image,
}) {
  return Container(
    height: SizeConfig.blockSizeVertical * 60,
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        /// title
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            model.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorHelper.todoBlack.color,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Divider(
          color: ColorHelper.lightPurple.color,
          height: 1,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          width: 130,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                color: ColorHelper.mainPurple.color,
                size: 22,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: Text(model.dueDate),
              ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(color: ColorHelper.todoGrey.color),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        if (model.description.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: SizeConfig.blockSizeVertical * 10,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Text(
                  model.description,
                  style: TextStyle(
                    color: ColorHelper.todoBlack.color,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        else
          commonEmptyContainer(),
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          width: 230,
          decoration: BoxDecoration(
            border: Border.all(color: ColorHelper.todoGrey.color),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
            title: Text(
              'Task status: ',
              style: TextStyle(
                color: ColorHelper.todoBlack.color,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: model.isDone.taskStatus(),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: FlatButton.icon(
                  onPressed: () => onLeftButtonPressed(),
                  color: ColorHelper.todoWhite.color,
                  icon: Icon(
                    Icons.delete,
                    color: ColorHelper.deleteRed.color,
                  ),
                  label: const Text('Delete task'),
                ),
              ),
              Container(
                child: FlatButton.icon(
                  onPressed: () => onRightButtonPressed(),
                  color: ColorHelper.todoWhite.color,
                  icon: Icon(
                    Icons.update,
                    color: ColorHelper.lightPurple.color,
                  ),
                  label: const Text('Update task'),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
