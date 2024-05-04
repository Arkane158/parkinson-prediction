import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/add_patient/add_patient_screen.dart';
import 'package:parkinson_app/presentation/appointments/appointments_screen.dart';
import 'package:parkinson_app/presentation/change_password/change_password_screen.dart';
import 'package:parkinson_app/presentation/doctor_data_collection/doctor_data_collection_screen.dart';
import 'package:parkinson_app/presentation/doctor_home/app_bar_bottom_nav_bar.dart';
import 'package:parkinson_app/presentation/edit/edit_screen.dart';
import 'package:parkinson_app/presentation/forgot_password/forgot_password.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';
import 'package:parkinson_app/presentation/predict/predict_screen_after_add_patient.dart';
import 'package:parkinson_app/presentation/predict/predict_screen_before_add_patient.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account.dart';
import 'package:parkinson_app/presentation/profile/privacy%20policy/privacy_policy_screen.dart';
import 'package:parkinson_app/presentation/profile/profile_screen.dart';
import 'package:parkinson_app/presentation/signup/signup_screen.dart';
import 'package:parkinson_app/presentation/theme_data.dart';
import 'package:parkinson_app/presentation/verify%20screen/verify_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: {
        LoginScreen.screenName: (context) => LoginScreen(),
        SignUpScreen.screenName: (context) => SignUpScreen(),
        ForgotPassword.screenName: (context) => ForgotPassword(),
        VerifyScreen.screenName: (context) => VerifyScreen(),
        ChangePasswordScreen.screenName: (context) => ChangePasswordScreen(),
        DoctorDataCollectionScreen.screenName: (context) =>
            DoctorDataCollectionScreen(),
        AppBarAndBottomNav.screenName: (context) => const AppBarAndBottomNav(),
        ProfileScreen.screenName: (context) => const ProfileScreen(),
        EditScreen.screenName: (context) => const EditScreen(),
        PredictScreenBeforeAddingPatient.screenName: (context) =>
            const PredictScreenBeforeAddingPatient(),
        AddPatientScreen.screenName: (context) => const AddPatientScreen(),
        AppointmentsScreen.screenName: (context) => const AppointmentsScreen(),
        PredictScreenAfterAddingPatient.screenName: (context) =>
            const PredictScreenAfterAddingPatient(),
        EditAccount.screenName: (context) => const EditAccount(),
        PrivacyPolicyScreen.screenName: (context) => const PrivacyPolicyScreen()
      },
      initialRoute: LoginScreen.screenName,
    );
  }
}
