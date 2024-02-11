import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/custom_widgets/auth_widget.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String screenName = "signup-screen";
  SignUpScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
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
                        const AuthWidget(tittle: 'SignUp'),
                        CustomTextFormField(
                          title: 'User Name',
                          controller: _userNameController,
                          hint: 'User Name',
                          icon: const Icon(Icons.person_outline_rounded),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Email is required';
                            }
                            return null; // Return null if the email is valid
                          },
                        ),
                        SizedBox(
                          height: height * .04,
                        ),
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
                        SizedBox(
                          height: height * .04,
                        ),
                        CustomElevatedButton(
                            onPressed: login, label: 'Sign Up'),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: height * .02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account ?  ',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, LoginScreen.screenName);
                                },
                                child: Text(
                                  'Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              )
                            ],
                          ),
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
