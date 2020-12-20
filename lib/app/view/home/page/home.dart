import 'package:flutter/material.dart';
import 'package:todo/app/view/home/widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: WillPopScope(
        onWillPop: () => null,
        child: ListView(
          children: <Widget>[],
        ),
      ),
    );
  }
}


