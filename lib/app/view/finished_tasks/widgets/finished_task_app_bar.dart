import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/common/common_app_bar.dart';
import 'package:todo/common/common_empty_container.dart';

PreferredSizeWidget finishedAppBar(BuildContext context) {
  return commonAppBar(
    title: '',
    backgroundColor: ColorHelper.mainPurple.color,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: ColorHelper.todoWhite.color,
      ),
      onPressed: () => Navigator.of(context).pop(),
    ),
    elevation: 0,
    action: commonEmptyContainer(),
  );
}
