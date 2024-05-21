import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/model/patient.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_icon_button.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/doctor_home/app_bar_bottom_nav_bar.dart';
import 'package:parkinson_app/presentation/edit/edit_patient_info/edit_patient_info_view_model.dart';

class EditPatientInfoScreen extends StatefulWidget {
  const EditPatientInfoScreen({super.key});
  static const String screenName = "EditPatientInfoScreen";

  @override
  State<EditPatientInfoScreen> createState() => _EditPatientInfoScreenState();
}

class _EditPatientInfoScreenState extends State<EditPatientInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String? gender;
  final EditPatientInfoViewModel viewModel = EditPatientInfoViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Patient patient =
          ModalRoute.of(context)!.settings.arguments as Patient;
      gender = patient.gender;
      _nameController.text = patient.name;
      _phoneController.text = patient.phone;
      _ageController.text = patient.age;
      _addressController.text = patient.address!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 245, 245),
      appBar: AppBar(title: const Text('Edit Patient')),
      body: BlocProvider(
        create: (context) => viewModel,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * .03,
                          horizontal: size.width * .03,
                        ),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              title: 'Name',
                              controller: _nameController,
                              hint: 'Enter Name',
                              icon: const Icon(Icons.person),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: size.height * .03),
                            CustomTextFormField(
                              type: TextInputType.number,
                              title: 'Phone Number',
                              controller: _phoneController,
                              hint: 'Phone Number',
                              icon: const Icon(Icons.phone),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: size.height * .03),
                            CustomTextFormField(
                              type: TextInputType.number,
                              title: 'Age',
                              controller: _ageController,
                              hint: 'Enter Age',
                              icon: const Icon(Icons.calendar_month_outlined),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your age';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: size.height * .03),
                            CustomTextFormField(
                              title: 'Address',
                              controller: _addressController,
                              hint: 'Enter Address',
                              icon: const Icon(Icons.location_on),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your address';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: size.height * .03),
                            BlocConsumer<EditPatientInfoViewModel,
                                EditPatientInfoState>(
                              listener: (context, state) {
                                if (state is LoadingState) {
                                  DialogeUtils.showProgressDialog(
                                      context, 'Loading...');
                                } else if (state is ErrorState) {
                                  DialogeUtils.showMessage(
                                    context,
                                    state.errorMessage,
                                    posActionTitle: 'Ok',
                                  );
                                } else if (state is SuccessState) {
                                  DialogeUtils.showMessage(
                                    context,
                                    state.message,
                                    posActionTitle: 'Ok',
                                    posAction: () {
                                      Navigator.pushReplacementNamed(context,
                                          AppBarAndBottomNav.screenName);
                                    },
                                  );
                                } else if (state is HideLoadingState) {
                                  Navigator.pop(context);
                                }
                              },
                              builder: (context, state) {
                                return CustomElevatedIconButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      DialogeUtils.showMessage(
                                        context,
                                        'Are You sure you want to Edit?',
                                        posActionTitle: 'Yes',
                                        posAction: () {
                                          final Patient patient =
                                              ModalRoute.of(context)!
                                                  .settings
                                                  .arguments as Patient;
                                          viewModel.editPatient(
                                            patient.id,
                                            _nameController.text,
                                            _phoneController.text,
                                            _ageController.text,
                                            _addressController.text,
                                            gender!,
                                          );
                                        },
                                        negActionTitle: 'No',
                                        negAction: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    }
                                  },
                                  label: 'Edit Patient Information',
                                  icon: const Icon(Icons.edit),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
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
}
