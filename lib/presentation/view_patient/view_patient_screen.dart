import 'package:flutter/material.dart';
import 'package:parkinson_app/data/model/patient.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/predict/predict_screen_after_add_patient.dart';
import 'package:parkinson_app/presentation/view_patient/view_patient_data_field_item.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ViewPatientScreen extends StatefulWidget {
  const ViewPatientScreen({super.key});
  static const String screenName = "PatientScreen";

  @override
  State<ViewPatientScreen> createState() => _ViewPatientScreenState();
}

class _ViewPatientScreenState extends State<ViewPatientScreen> {
  @override
  Widget build(BuildContext context) {
    Patient patient = ModalRoute.of(context)?.settings.arguments as Patient;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 219, 217, 217), // Background color

      appBar: AppBar(
        title: Text(patient.name),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * .3,
                  color: Theme.of(context).primaryColor,
                ),
                Positioned(
                  top: size.height * .005,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                        'assets/images/view_patient.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: size.height * .05,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 219, 217, 217),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ViewPatientDataFieldItem(
                    tittle: 'Name',
                    icon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    ),
                    content: patient.name,
                  ),
                  ViewPatientDataFieldItem(
                    tittle: 'Phone',
                    icon: Icon(
                      Icons.phone,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    ),
                    content: patient.phone,
                  ),
                  ViewPatientDataFieldItem(
                    tittle: 'Address',
                    icon: Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    ),
                    content: patient.address!,
                  ),
                  ViewPatientDataFieldItem(
                    tittle: 'Age',
                    icon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    ),
                    content: patient.age,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * .02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Score",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        LinearPercentIndicator(
                          barRadius: const Radius.circular(5),
                          width: 170.0,
                          animation: true,
                          animationDuration: 10,
                          lineHeight: 30.0,
                          percent: patient.score == '0' ? 0 : .8,
                          center: Text(
                            "${patient.score}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          progressColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, PredictScreenAfterAddingPatient.screenName,
                            arguments: patient);
                      },
                      label: 'Predict')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
