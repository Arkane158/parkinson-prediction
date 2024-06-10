import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/doctor_data_collection/doctor_data_collection_view_model.dart';
import 'package:day_picker/day_picker.dart';
import 'package:parkinson_app/presentation/doctor_home/app_bar_bottom_nav_bar.dart';

class DoctorDataCollectionScreen extends StatefulWidget {
  const DoctorDataCollectionScreen({Key? key}) : super(key: key);
  static const String screenName = "doctor-data-collection-screen";

  @override
  State<DoctorDataCollectionScreen> createState() =>
      _DoctorDataCollectionScreenState();
}

class _DoctorDataCollectionScreenState
    extends State<DoctorDataCollectionScreen> {
  final TextEditingController _stepController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  DoctorDataCollectionViewModel viewModel = DoctorDataCollectionViewModel();
  File? file;
  TimeOfDay? _fromTime1;
  TimeOfDay? _toTime1;
  late List<String> selectedDays;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var spacing = height * .02;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: BlocProvider(
        create: (context) => viewModel,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(height: spacing),
                        InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: Center(
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: file != null
                                      ? FileImage(File(file!.path))
                                      : const AssetImage(
                                              'assets/images/doctor.png')
                                          as ImageProvider<Object>?,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: spacing),
                        Text(
                          'Please Upload Your Image',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        CustomTextFormField(
                          title: 'Name',
                          controller: _nameController,
                          hint: 'Name',
                          icon: const Icon(Icons.person),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: spacing),
                        CustomTextFormField(
                          title: 'Phone Number',
                          controller: _phoneController,
                          hint: 'Phone Number',
                          icon: const Icon(Icons.phone),
                          type: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: spacing),
                        CustomTextFormField(
                          title: 'Address',
                          controller: _addressController,
                          hint: 'Address',
                          icon: const Icon(Icons.location_on),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: spacing),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Working Days',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        SizedBox(height: spacing),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SelectWeekDays(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              days: _days,
                              border: false,
                              boxDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0,
                                        3), // changes the position of the shadow
                                  ),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  colors: [
                                    Theme.of(context).primaryColor,
                                    Theme.of(context).primaryColor
                                  ],
                                  tileMode: TileMode
                                      .repeated, // repeats the gradient over the canvas
                                ),
                              ),
                              onSelect: (values) {
                                // <== Callback to handle the selected days
                                selectedDays = values;
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: spacing),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("From",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text("To",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(height: spacing),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () => _selectFromTime1(context),
                              child: Text(
                                _fromTime1 != null
                                    ? _formatTime(_fromTime1!)
                                    : "Select Time",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _selectToTime1(context),
                              child: Text(
                                _toTime1 != null
                                    ? _formatTime(_toTime1!)
                                    : "Select Time",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: spacing),
                        CustomTextFormField(
                          title: 'Examination Time',
                          controller: _stepController,
                          hint: 'Time of 1 ex in minutes',
                          icon: const Icon(Icons.timer),
                          type: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter examination time';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: spacing),
                        BlocConsumer<DoctorDataCollectionViewModel,
                                DoctorDataCollectionState>(
                            listener: (context, state) {
                          if (state is LoadingState) {
                            DialogeUtils.showProgressDialog(
                                context, 'Loading...');
                          } else if (state is ErrorState) {
                            DialogeUtils.showMessage(
                                context, state.errorMessage,
                                posActionTitle: 'Ok');
                          } else if (state is SuccessState) {
                            DialogeUtils.showMessage(context, state.message,
                                posActionTitle: 'Ok', posAction: () {
                              Navigator.pushReplacementNamed(
                                  context, AppBarAndBottomNav.screenName);
                            });
                          } else if (state is HideLoadingState) {
                            Navigator.pop(context);
                          }
                        }, builder: (context, state) {
                          return CustomElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate() &&
                                  file != null &&
                                  _fromTime1 != null &&
                                  _toTime1 != null) {
                                String fromTime = _formatTime(_fromTime1!);
                                String toTime = _formatTime(_toTime1!);

                                viewModel.doctorDataCollection(
                                    file!,
                                    _nameController.text,
                                    _phoneController.text,
                                    _addressController.text,
                                    selectedDays.toString(),
                                    fromTime,
                                    toTime,
                                    _stepController.text);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Please fill all required fields'),
                                  ),
                                );
                              }
                            },
                            label: "Submit",
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

  Future<void> _selectFromTime1(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _fromTime1 = picked;
      });
    }
  }

  Future<void> _selectToTime1(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _toTime1 = picked;
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final formattedTime = DateFormat('HH:mm').format(dateTime);
    return formattedTime;
  }

  Future pickImage() async {
    final myfile = await picker.pickImage(source: ImageSource.gallery);
    if (myfile == null) return;
    setState(() {
      file = File(myfile.path);
    });
  }
}

List<DayInWeek> _days = [
  DayInWeek("Sun", dayKey: 'Sunday'),
  DayInWeek("Mon", dayKey: 'Monday'),
  DayInWeek("Tue", isSelected: true, dayKey: 'Tuesday'),
  DayInWeek("Wed", dayKey: 'Wednesday'),
  DayInWeek("Thu", dayKey: 'Thursday'),
  DayInWeek("Fri", dayKey: 'Friday'),
  DayInWeek("Sat", dayKey: 'Saturday'),
];
