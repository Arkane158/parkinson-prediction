import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';
import 'package:parkinson_app/presentation/verify%20screen/verify_screen.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  static const String screenName = "ForgotPassword";
  final TextEditingController _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
      body: Form(
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
                      CustomElevatedButton(onPressed: ()=> send(context), label: 'Send')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void send(BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      // If the form is validated and nothing is wrong, navigate to another screen
      Navigator.pushReplacementNamed(context, VerifyScreen.screenName);
    }
  }
}
