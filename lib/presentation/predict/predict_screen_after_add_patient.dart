import 'package:flutter/material.dart';

import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_icon_button.dart';

class PredictScreenAfterAddingPatient extends StatelessWidget {
  const PredictScreenAfterAddingPatient({super.key});
  static const String screenName = "predictionScreenAfterAddingPatient';";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Prediction'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                    child: Column(
                      children: [
                        const Image(
                            image: AssetImage(
                                'assets/images/prediction_logo.png')),
                        Text(
                          'Welcome Doctor!',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                        const Text(
                          "If you want to know whether a person has Parkinson's disease or not, you have to enter the voice to display the prediction",
                          textAlign: TextAlign.center,
                        ),

                        // Container with Gradient
                        SizedBox(
                          height: size.height * .05,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .03),
                            child: CustomElevatedIconButton(
                                onPressed: () {},
                                label: 'Upload Audio',
                                icon: const ImageIcon(AssetImage(
                                    'assets/images/upload_audio_icon.png')))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
