import 'package:flutter/material.dart';
import 'package:todo/app/utils/navigation_animations.dart';
import 'package:todo/app/view/home/page/home.dart';
import 'package:todo/app/view/login/page/login_page.dart';
import 'package:todo/app/view/registration/page/register_page.dart';
import 'package:todo/routing/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    /// these args are for arguments,
    /// if we need to pass some argument we will do it through args
    // final dynamic args = settings.arguments;

    switch (settings.name) {
      case SignIn:
        return SlideAnimationTween(widget: LoginPage());
      case SignUp:
        return SlideAnimationTween(widget: RegistrationPage());
        case Home:
        return SlideAnimationTween(widget: HomePage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<void>(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Container(
            child: const Text('Error Screen'),
          ),
        ),
      );
    });
  }
}
