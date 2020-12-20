import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/providers/auth_provider.dart';
import 'package:todo/app/view/login/widgets/login_button.dart';
import 'package:todo/app/view/login/widgets/login_logo_headline.dart';
import 'package:todo/app/view/login/widgets/login_tappable.dart';
import 'package:todo/app/view/login/widgets/login_text_form_fields.dart';
import 'package:todo/routing/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthProvider _authProvider =
        Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: <Widget>[
              logoHeadline(),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: emailTextFormField(
                          controller: _emailController,
                        ),
                      ),
                      Container(
                        child: passwordTextFormField(
                          controller: _passwordController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: loginButton(
                  onPressed: () => _authProvider.loginUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                    key: _loginFormKey,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: loginTappable(
                  onPressed: (int onPress) =>
                      Navigator.of(context).pushNamed(SignUp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
