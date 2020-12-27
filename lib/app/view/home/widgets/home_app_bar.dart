import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/app/providers/auth_provider.dart';
import 'package:todo/app/utils/color_helper.dart';
import 'package:todo/common/common_app_bar.dart';
import 'package:todo/routing/routes.dart';

String dateNow() {
  final DateFormat f = DateFormat('dd MMM');
  final DateTime now = DateTime.now();
  final String date = f.format(now);
  return date;
}

PreferredSizeWidget homeAppBar(
    {AuthProvider authProvider, BuildContext context}) {
  return commonAppBar(
    title: dateNow(),
    backgroundColor: ColorHelper.mainPurple.color,
    elevation: 0,
    action: IconButton(
      icon: Icon(
        Icons.check,
        color: ColorHelper.todoWhite.color,
      ),
      onPressed: () => print('Navigate to screen to show time that is left'),
    ),
    leading: IconButton(
      icon: Icon(
        Icons.settings,
        color: ColorHelper.todoWhite.color,
      ),
      onPressed: () => authProvider.logoutUser().then(
            (_) => Navigator.of(context)
                .pushNamedAndRemoveUntil(SignIn, (_) => false),
          ),
    ),
  );
}
