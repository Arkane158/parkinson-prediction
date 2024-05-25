import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/presentation/custom_widgets/auth_widget.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';
import 'package:parkinson_app/presentation/signup/sign_up_view_model.dart';
import 'package:parkinson_app/presentation/verify%20screen/verify_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String screenName = "signup-screen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel viewModel = SignUpViewModel();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    const spacing = .02;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => viewModel,
        child: Padding(
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
                            height: height * spacing,
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
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');

                              if (!emailRegExp.hasMatch(text)) {
                                return 'Please enter a valid email address';
                              }
                              return null; // Return null if the email is valid
                            },
                          ),
                          SizedBox(
                            height: height * spacing,
                          ),
                          CustomTextFormField(
                            title: 'Phone',
                            type: TextInputType.phone,
                            controller: _phoneController,
                            hint: 'Phone',
                            icon: const Icon(Icons.phone_outlined),
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Phone number is required';
                              }

                              // Check if phone number length is not equal to 11 digits
                              if (text.length != 11) {
                                return 'Phone number must be 11 digits long';
                              }

                              return null; // Return null if the email is valid
                            },
                          ),
                          SizedBox(
                            height: height * spacing,
                          ),
                          CustomTextFormField(
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Password is required';
                              }

                              // Check if password length is less than 8 characters
                              if (text.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }

                              // Check if password contains at least one uppercase letter
                              if (!text.contains(RegExp(r'[A-Z]'))) {
                                return 'Password must contain at least one uppercase letter';
                              }

                              // Check if password contains at least one lowercase letter
                              if (!text.contains(RegExp(r'[a-z]'))) {
                                return 'Password must contain at least one lowercase letter';
                              }

                              // Check if password contains at least one special character
                              if (!text.contains(
                                  RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                return 'Password must contain at least one special character';
                              }

                              // Password meets all criteria
                              return null;
                            },
                            title: 'Password',
                            controller: _passwordController,
                            hint: 'Password',
                            icon: const Icon(Icons.lock_outline_rounded),
                          ),
                          SizedBox(
                            height: height * spacing,
                          ),
                          BlocConsumer<SignUpViewModel, SignUpState>(
                              listener: (context, state) {
                            if (state is LoadingState) {
                              DialogeUtils.showProgressDialog(
                                  context, 'Loading...');
                            } else if (state is ErrorState) {
                              DialogeUtils.showMessage(
                                  context, state.errorMessage,
                                  posActionTitle: 'Ok');
                            } else if (state is SuccessState) {
                              Navigator.pushNamed(
                                  context, VerifyScreen.screenName, arguments: [
                                _emailController.text,
                                SignUpScreen.screenName,
                              ]);
                            } else if (state is HideLoadingState) {
                              Navigator.pop(context);
                            }
                          }, builder: (context, state) {
                            return CustomElevatedButton(
                              onPressed: () {
                                signUp();
                              },
                              label: 'Sign Up',
                            );
                          }),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * .02),
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
      ),
    );
  }

  signUp() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.signUp(_userNameController.text, _emailController.text,
        _passwordController.text, _phoneController.text);
  }
}
