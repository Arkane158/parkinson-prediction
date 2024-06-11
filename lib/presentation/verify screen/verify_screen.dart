import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/presentation/change_password/change_password_screen.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/forgot_password/forgot_password.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';
import 'package:parkinson_app/presentation/signup/signup_screen.dart';
import 'package:parkinson_app/presentation/verify%20screen/verify_view_model.dart';
import 'package:pinput/pinput.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});
  static const String screenName = "verify-screen";

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  VerifyAccountViewModel viewModel = VerifyAccountViewModel();
  final pinController = TextEditingController();

  final focusNode = FocusNode();

  final formKey = GlobalKey<FormState>();
  late String email;

  late Object previousScreenName;
  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Object?>? arguments =
        ModalRoute.of(context)?.settings.arguments as List<Object?>?;
    if (arguments != null) {
      email = arguments[0] as String;
      previousScreenName = arguments[1] as String;
    }
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
          previousScreenName == SignUpScreen.screenName
              ? 'Verify Account'
              : 'Forgot Password',
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
                            separatorBuilder: (index) =>
                                const SizedBox(width: 8),
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
                        // Text(
                        //   'Please Enter Your Verification Code',
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .titleSmall
                        //       ?.copyWith(color: Theme.of(context).primaryColor),
                        //   textAlign: TextAlign.center,
                        // ),
                        SizedBox(
                          height: size.height * .06,
                        ),
                        BlocConsumer<VerifyAccountViewModel, VerifyState>(
                            listener: (context, state) {
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
                              'Account Created Successfully',
                              posActionTitle: 'Ok',
                              posAction: () {
                                if (previousScreenName ==
                                    SignUpScreen.screenName) {
                                  Navigator.pushNamed(
                                      context, LoginScreen.screenName);
                                }
                                if (previousScreenName ==
                                    ForgotPassword.screenName) {
                                  Navigator.pushReplacementNamed(
                                      context, ChangePasswordScreen.screenName,
                                      arguments: email);
                                }
                              },
                            );
                          } else if (state is HideLoadingState) {
                            Navigator.pop(context);
                          }
                        }, builder: (context, state) {
                          return CustomElevatedButton(
                            onPressed: () {
                              verify();
                            },
                            label: 'Verify',
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

  void verify() {
    focusNode.unfocus();
    if (formKey.currentState?.validate() == false) {
      return;
    }
    if (previousScreenName == SignUpScreen.screenName) {
      viewModel.verifyAccount(email, pinController.text);
    }
    if (previousScreenName == ForgotPassword.screenName) {
      viewModel.verifyResetPassword(email, pinController.text);
    }
  }
}
