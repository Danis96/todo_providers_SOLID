

import 'package:flutter/material.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/common/common_app_bar.dart';
import 'package:todo/common/common_empty_container.dart';

PreferredSizeWidget addTaskAppBar(BuildContext context) {
  return commonAppBar(
    title: '',
    backgroundColor: ColorHelper.mainPurple.color,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: ColorHelper.todoWhite.color,
      ),
      onPressed: () => Navigator.of(context).pop(),
    ),
    action: commonEmptyContainer(),
  );
}
