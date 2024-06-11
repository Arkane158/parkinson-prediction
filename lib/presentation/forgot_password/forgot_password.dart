import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/forgot_password/forgot_password_view_model.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';
import 'package:parkinson_app/presentation/verify%20screen/verify_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  static const String screenName = "ForgotPassword";

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  ForgotPasswordViewModel viewModel = ForgotPasswordViewModel();

  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pushNamed(context, LoginScreen.screenName),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Forgot Password',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: BlocProvider(
        create: (context) => viewModel,
        child: Form(
          key: formKey,
          child: Column(
            children: [
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
                                  image: AssetImage(
                                    'assets/images/forgotPassword.png',
                                  ),
                                  fit: BoxFit.scaleDown,
                                ))),
                        Text(
                          'Please Enter Your Email Address to receive a Verification Code',
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * .04,
                          ),
                          child: CustomTextFormField(
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
                              title: 'Email',
                              controller: _emailController,
                              hint: 'Email',
                              icon: const Icon(Icons.email_outlined)),
                        ),
                        BlocConsumer<ForgotPasswordViewModel,
                            ForgotPasswordState>(listener: (context, state) {
                          if (state is LoadingState) {
                            DialogeUtils.showProgressDialog(
                                context, 'Loading...');
                          } else if (state is ErrorState) {
                            DialogeUtils.showMessage(
                                context, state.errorMessage,
                                posActionTitle: 'Ok');
                          } else if (state is SuccessState) {
                            DialogeUtils.showMessage(
                              context,
                              state.message,
                              posActionTitle: 'Ok',
                              posAction: () => Navigator.pushNamed(
                                  context, VerifyScreen.screenName, arguments: [
                                _emailController.text,
                                ForgotPassword.screenName
                              ]),
                            );
                          } else if (state is HideLoadingState) {
                            Navigator.pop(context);
                          }
                        }, builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: CustomElevatedButton(
                              onPressed: () {
                                send();
                              },
                              label: 'Send',
                            ),
                          );
                        }),
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

  void send() {
    if (formKey.currentState?.validate() == false) {
      // If the form is validated and nothing is wrong, navigate to another screen
      return;
    }
    viewModel.forgotPassword(_emailController.text);
  }
}
