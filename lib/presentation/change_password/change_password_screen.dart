import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  static const String screenName = "change-password";
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Create New Password',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: SizedBox(
                          height: size.height * .4,
                          width: size.width * .6,
                          child: const Image(
                            image:
                                AssetImage('assets/images/changePassword.png'),
                            fit: BoxFit.scaleDown,
                          ))),
                  Text(
                    'New password',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * .03),
                    child: CustomTextFormField(
                        title: 'Password',
                        controller: _passwordController,
                        hint: "New Password",
                        icon: const Icon(Icons.lock_outline_sharp)),
                  ),
                  CustomTextFormField(
                      title: 'Password Confirmation',
                      controller: _passwordConfirmationController,
                      hint: "Confirm Password",
                      icon: const Icon(Icons.lock_outline_sharp)),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.screenName);
                      },
                      label: 'Reset Password')
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
