import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/add_patient/add_patient_screen.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';

class PredictScreenBeforeAddingPatient extends StatelessWidget {
  const PredictScreenBeforeAddingPatient({super.key});
  static const String screenName = "predictionScreen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .05),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/images/prediction_logo.png')),
            Text(
              'Welcome Doctor!',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: size.height * .03,
            ),
            const Text(
              "Please Add Patient So That You Can Make A Prediction",
              textAlign: TextAlign.center,
            ),

            // Container with Gradient
            SizedBox(
              height: size.height * .05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .03),
              child: CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddPatientScreen.screenName);
                  },
                  label: 'Add Patient'),
            ),
          ],
        ),
      ),
    );
  }
}
