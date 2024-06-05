import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkinson_app/firebase_options.dart';
import 'package:parkinson_app/presentation/edit/edit_patient_info/edit_patient_info_screen.dart';
import 'package:parkinson_app/presentation/predict/predict_screen_after_add_patient.dart';
import 'package:parkinson_app/presentation/profile/about_us/about_us_screen.dart';
import 'package:parkinson_app/presentation/profile/account/edit/change_account_data_screen.dart';
import 'package:parkinson_app/presentation/profile/account/edit/change_img_screen.dart';
import 'package:parkinson_app/presentation/profile/help/help_screen.dart';
import 'package:parkinson_app/presentation/signup/signup_screen.dart';
import 'package:parkinson_app/presentation/add_patient/add_patient_screen.dart';
import 'package:parkinson_app/presentation/appointments/appointments_screen.dart';
import 'package:parkinson_app/presentation/change_password/change_password_screen.dart';
import 'package:parkinson_app/presentation/doctor_data_collection/doctor_data_collection_screen.dart';
import 'package:parkinson_app/presentation/doctor_home/app_bar_bottom_nav_bar.dart';
import 'package:parkinson_app/presentation/edit/edit_screen.dart';
import 'package:parkinson_app/presentation/forgot_password/forgot_password.dart';
import 'package:parkinson_app/presentation/predict/predict_screen_before_add_patient.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account.dart';
import 'package:parkinson_app/presentation/profile/privacy%20policy/privacy_policy_screen.dart';
import 'package:parkinson_app/presentation/profile/profile_screen.dart';
import 'package:parkinson_app/presentation/verify%20screen/verify_screen.dart';
import 'package:parkinson_app/presentation/theme_data.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';
import 'package:parkinson_app/presentation/view_patient/view_patient_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: LoginScreen.screenName,
      routes: {
        LoginScreen.screenName: (context) => const LoginScreen(),
        SignUpScreen.screenName: (context) => const SignUpScreen(),
        ForgotPassword.screenName: (context) => const ForgotPassword(),
        VerifyScreen.screenName: (context) => const VerifyScreen(),
        ChangePasswordScreen.screenName: (context) =>
            const ChangePasswordScreen(),
        DoctorDataCollectionScreen.screenName: (context) =>
            const DoctorDataCollectionScreen(),
        AppBarAndBottomNav.screenName: (context) => const AppBarAndBottomNav(),
        ProfileScreen.screenName: (context) => const ProfileScreen(),
        EditScreen.screenName: (context) => const EditScreen(),
        PredictScreenBeforeAddingPatient.screenName: (context) =>
            const PredictScreenBeforeAddingPatient(),
        AddPatientScreen.screenName: (context) => const AddPatientScreen(),
        AppointmentsScreen.screenName: (context) => const AppointmentsScreen(),
        EditAccount.screenName: (context) => const EditAccount(),
        PrivacyPolicyScreen.screenName: (context) =>
            const PrivacyPolicyScreen(),
        EditPatientInfoScreen.screenName: (context) =>
            const EditPatientInfoScreen(),
        ChangePersonalPhoto.screenName: (context) =>
            const ChangePersonalPhoto(),
        ChangeAccountDataScreen.screenName: (context) =>
            const ChangeAccountDataScreen(),
        ViewPatientScreen.screenName: (context) => const ViewPatientScreen(),
        PredictScreenAfterAddingPatient.screenName: (context) =>
            const PredictScreenAfterAddingPatient(),
        AboutUsScreen.screenName: (context) => const AboutUsScreen(),
        HelpScreen.screenName:(context) => const HelpScreen()

      },
    );
  }
}
