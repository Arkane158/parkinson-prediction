import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/profile/privacy%20policy/expandable_container.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  static const String screenName = 'ascreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ExpandableContainer(
                        title: 'What is ParkiCare?',
                        content:
                            "ParkiCare is an app designed to help healthcare professionals predict the likelihood of Parkinson's disease in patients using advanced algorithms and machine learning. It provides accurate risk assessments to aid in early diagnosis and intervention."),
                    ExpandableContainer(
                        title: 'How do I install ParkiCare?',
                        content:
                            'You can download ParkiCare from the App Store or Google Play. Follow the on-screen instructions to complete the installation'),
                    ExpandableContainer(
                        title: ' How do I set up a new account on ParkiCare?',
                        content:
                            'Click on "Create Account" and enter your professional details. Verify your email address to activate your account'),
                    ExpandableContainer(
                        title:
                            'What can I find on the main dashboard of ParkiCare?',
                        content:
                            "The main dashboard provides an overview of your activities, including patient profiles, recent predictions, and notifications."),
                    ExpandableContainer(
                        title:
                            'How do I add a new patient profile in ParkiCare?',
                        content:
                            "Go to the 'Patients' section, click 'Add New Patient,' and fill in the required information"),
                    ExpandableContainer(
                        title: 'Join Us on This Journey',
                        content:
                            "We invite you to join us on this exciting journey to transform healthcare. Together, we can harness the power of technology to predict, prevent, and personalize medical care, ultimately improving the lives of patients everywhere."),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
