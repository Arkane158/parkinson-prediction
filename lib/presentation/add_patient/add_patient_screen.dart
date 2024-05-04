import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_icon_button.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/predict/predict_screen_after_add_patient.dart';

class AddPatientScreen extends StatefulWidget {
  static const String screenName = "addPatientScreen";

  const AddPatientScreen({Key? key}) : super(key: key);

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String? gender; // Moved gender to the class level

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 245, 245),
      appBar: AppBar(title: const Text('Add Patient')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * .03,
                        horizontal: size.width * .03),
                    child: Form(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              CustomTextFormField(
                                title: 'Name',
                                controller: _nameController,
                                hint: 'Enter Name',
                                icon: const Icon(Icons.person),
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              CustomTextFormField(
                                title: 'Phone Number',
                                controller: _phoneController,
                                hint: 'Phone Number',
                                icon: const Icon(Icons.phone),
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              CustomTextFormField(
                                title: 'Age',
                                controller: _ageController,
                                hint: 'Enter Age',
                                icon: const Icon(Icons.calendar_month_outlined),
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              CustomTextFormField(
                                title: 'Address',
                                controller: _addressController,
                                hint: 'Enter Address',
                                icon: const Icon(Icons.location_on),
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Gender :',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Flexible(
                                flex: 1,
                                child: RadioListTile(
                                  title: const Text(
                                    'Male',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: 'male',
                                  groupValue: gender,
                                  activeColor: Theme.of(context).primaryColor,
                                  contentPadding: EdgeInsets.zero,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value;
                                    });
                                  },
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: RadioListTile(
                                  title: const Text(
                                    'Female',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: 'female',
                                  activeColor: Theme.of(context).primaryColor,
                                  contentPadding: EdgeInsets.zero,
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          CustomElevatedIconButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context,
                                    PredictScreenAfterAddingPatient.screenName);
                              },
                              label: 'Predict',
                              icon: const ImageIcon(
                                  AssetImage('assets/images/predict.png')))
                        ],
                      ),
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
