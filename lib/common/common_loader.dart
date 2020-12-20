import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'common_alert_dialog.dart';


Future<void> loaderDialog({
  @required BuildContext context,
}) {
  return showMyDialog(
    context: context,
    barrier: false,
    title: '',
    mainWidget: const SpinKitCircle(
      size: 80.0,
      color: Colors.white,
    ),
    color: Colors.transparent,
    elevation: 0,
  );
}
