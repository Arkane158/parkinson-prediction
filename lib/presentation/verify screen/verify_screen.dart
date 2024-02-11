import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/change_password/change_password_screen.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:pinput/pinput.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});
  static const String screenName = "verify-screen";
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, color: Colors.white),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                              width: size.width * .5,
                              child: const Image(
                                image: AssetImage('assets/images/verify.png'),
                                fit: BoxFit.scaleDown,
                              ))),
                      Text(
                        'Please Enter Your Verification Code',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      Directionality(
                        // Specify direction if desired
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          controller: pinController,
                          focusNode: focusNode,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          separatorBuilder: (index) => const SizedBox(width: 8),
                          validator: (value) {
                            return;
                            // return value == '2222' ? null : 'Pin is incorrect';
                          },
                          // onClipboardFound: (value) {
                          //   debugPrint('onClipboardFound: $value');
                          //   pinController.setText(value);
                          // },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      Text(
                        'Please Enter Your Verification Code',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height * .06,
                      ),
                      CustomElevatedButton(
                          onPressed: () {
                            verify(context);
                          },
                          label: 'Verify')
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

  void verify(BuildContext context) {
    focusNode.unfocus();
    if (formKey.currentState?.validate() == true) {
      Navigator.pushReplacementNamed(context, ChangePasswordScreen.screenName);
    }
  }
}
