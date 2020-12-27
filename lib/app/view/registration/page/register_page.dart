import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/providers/auth_provider.dart';
import 'package:todo/app/view/registration/widgets/register_button.dart';
import 'package:todo/app/view/registration/widgets/register_logo_headline.dart';
import 'package:todo/app/view/registration/widgets/register_tappable.dart';
import 'package:todo/app/view/registration/widgets/register_text_form_field.dart';
import 'package:todo/common/common_loader.dart';
import 'package:todo/common/common_popup_dialog.dart';
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
                        margin: const EdgeInsets.only(top: 5),
                        child: passwordRegisterTextFormField(
                          controller: _passwordController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
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
                  onPressed: () => registerUser(
                    context: context,
                    authProvider: _authProvider,
                  ),
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

  /// checking local validation
  /// then send registration request,
  /// then navigate to home,
  /// if false local validation show local errors,
  /// if false registration request show modal with parsed error
  void registerUser({
    BuildContext context,
    AuthProvider authProvider,
  }) {
    loaderDialog(context: context);
    final FormState _formState = _registerFormKey.currentState;
    if (_formState.validate()) {
      authProvider
          .registerUser(
        email: _emailController.text,
        password: _passwordConfirmController.text,
      )
          .then(
        (_) {
          if (authProvider.registerErrorMsg != null) {
            Navigator.of(context).pop();
            showCommonDialog(
              context: context,
              text: authProvider.registerErrorMsg,
              onButtonPressed: () => Navigator.of(context).pop(),
              image: 'assets/error.png',
            );
          } else {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamedAndRemoveUntil(
              Home,
              (_) => false,
            );
          }
        },
      );
    } else {
      Navigator.of(context).pop();
    }
  }
}
