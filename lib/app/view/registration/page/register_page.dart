import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/providers/auth_provider.dart';
import 'package:todo/app/view/registration/widgets/register_button.dart';
import 'package:todo/app/view/registration/widgets/register_logo_headline.dart';
import 'package:todo/app/view/registration/widgets/register_tappable.dart';
import 'package:todo/app/view/registration/widgets/register_text_form_field.dart';
import 'package:todo/routing/routes.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

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
              registerLogoHeadline(),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: emailRegisterTextFormField(
                          controller: _emailController,
                        ),
                      ),
                      Container(
                        child: passwordRegisterTextFormField(
                          controller: _passwordController,
                        ),
                      ),
                      Container(
                        child: confirmPasswordRegisterTextFormField(
                          controller: _passwordConfirmController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: registerButton(
                  onPressed: () => _authProvider.registerUser(
                    email: _emailController.text,
                    password: _passwordConfirmController.text,
                    key: _registerFormKey,
                  ).then((_) => print('User is registered')),
                  disable: _passwordController.text.isEmpty !=
                      _passwordConfirmController.text.isEmpty,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: registerTappable(
                  onPressed: (int onPress) =>
                      Navigator.of(context).pushNamed(SignIn),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
