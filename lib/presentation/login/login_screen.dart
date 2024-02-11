import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/custom_widgets/auth_widget.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/doctor_data_collection/doctor_data_collection_screen.dart';
import 'package:parkinson_app/presentation/forgot_password/forgot_password.dart';
import 'package:parkinson_app/presentation/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String screenName = "login-screen";
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .03),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const AuthWidget(tittle: 'Login'),
                        CustomTextFormField(
                          title: 'Email',
                          controller: _emailController,
                          hint: 'Email',
                          icon: const Icon(Icons.email_outlined),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Email is required';
                            }
                            // This regex pattern checks if the email format is valid
                            final emailRegExp =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailRegExp.hasMatch(text)) {
                              return 'Please enter a valid email address';
                            }
                            return null; // Return null if the email is valid
                          },
                        ),
                        SizedBox(
                          height: height * .04,
                        ),
                        CustomTextFormField(
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                          title: 'Password',
                          controller: _passwordController,
                          hint: 'Password',
                          icon: const Icon(Icons.lock_outline_rounded),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, ForgotPassword.screenName),
                              child: Text(
                                'Forgot Password?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: CustomElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context,
                                    DoctorDataCollectionScreen.screenName);
                              },
                              label: 'Login'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not have an account ? ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SignUpScreen.screenName);
                              },
                              child: Text(
                                'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
