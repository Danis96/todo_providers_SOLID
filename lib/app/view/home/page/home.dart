import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/providers/auth_provider.dart';
import 'package:todo/app/view/home/widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: homeAppBar(
        context: context,
        authProvider: authProvider,
      ),
      body: WillPopScope(
        onWillPop: () => null,
        child: ListView(
          children: <Widget>[],
        ),
      ),
    );
  }
}
