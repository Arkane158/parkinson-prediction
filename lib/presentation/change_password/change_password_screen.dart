import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/presentation/change_password/change_password_view_model.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});
  static const String screenName = "change-password";

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  @override
  dispose() {
    _passwordConfirmationController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  late String email;
  ChangePasswordViewModel viewModel = ChangePasswordViewModel();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var arguments = ModalRoute.of(context)?.settings.arguments;
    email = arguments.toString();
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
      body: BlocProvider(
        create: (context) => viewModel,
        child: Column(children: [
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
                                  'assets/images/changePassword.png'),
                              fit: BoxFit.scaleDown,
                            ))),
                    Text(
                      'New password',
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * .03),
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
                    BlocConsumer<ChangePasswordViewModel, ChangePasswordState>(
                        listener: (context, state) {
                      if (state is LoadingState) {
                        DialogeUtils.showProgressDialog(context, 'Loading...');
                      } else if (state is ErrorState) {
                        DialogeUtils.showMessage(context, state.errorMessage,
                            posActionTitle: 'Ok');
                      } else if (state is SuccessState) {
                        DialogeUtils.showMessage(
                          context,
                          "Password Reset Successfully",
                          posActionTitle: 'Ok',
                          posAction: () => Navigator.pushReplacementNamed(
                              context, LoginScreen.screenName),
                        );
                      } else if (state is HideLoadingState) {
                        Navigator.pop(context);
                      }
                    }, builder: (context, state) {
                      return CustomElevatedButton(
                          onPressed: () {
                            String password = _passwordController.text.trim();
                            String passwordConfirmation =
                                _passwordConfirmationController.text.trim();

                            // Check if passwords match
                            if (password != passwordConfirmation) {
                              DialogeUtils.showMessage(
                                  context, "Password don't match",
                                  posActionTitle: 'Ok');
                              return; // Return early if passwords don't match
                            }

                            // Passwords match, proceed with reset password logic
                            viewModel.resetPassword(email, password);
                          },
                          label: 'Reset Password');
                    }),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
