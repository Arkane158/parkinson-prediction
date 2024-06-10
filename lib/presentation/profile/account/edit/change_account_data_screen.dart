import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/doctor_home/app_bar_bottom_nav_bar.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account_view_model.dart';

class ChangeAccountDataScreen extends StatefulWidget {
  const ChangeAccountDataScreen({super.key});
  static const String screenName = "change_account_data_screen";

  @override
  State<ChangeAccountDataScreen> createState() =>
      _ChangeAccountDataScreenState();
}

class _ChangeAccountDataScreenState extends State<ChangeAccountDataScreen> {
  EditAccountViewModel viewModel = EditAccountViewModel();
  TextEditingController editController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? phone;
  String? workDays;
  String? startTime;
  String? endTime;
  String? step;
  TimeOfDay? _fromTime1;
  TimeOfDay? _toTime1;
  List<String> selectedDays = [];
  String? address;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String? doctorName = await DoctorPreference.getUserName();
    String? doctorEmail = await DoctorPreference.getUserEmail();
    String? doctorPhone = await DoctorPreference.getUserPhone();
    String? doctorWorkDays = await DoctorPreference.getUserWorkdays();
    String? doctorStartTime = await DoctorPreference.getUserStartTime();
    String? doctorEndTime = await DoctorPreference.getUserEndTime();
    String? doctorStep = await DoctorPreference.getUserStep();
    String? doctorAddress = await DoctorPreference.getUserAddress();
    setState(() {
      name = doctorName;
      email = doctorEmail;
      phone = doctorPhone;
      workDays = doctorWorkDays;
      startTime = doctorStartTime;
      endTime = doctorEndTime;
      step = doctorStep;
      address = doctorAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String title = '';
    title = ModalRoute.of(context)?.settings.arguments as String;
    var height = MediaQuery.of(context).size.height;
    var spacing = height * .02;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Change $title'),
      ),
      body: BlocProvider(
        create: (context) => viewModel,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .02, vertical: size.height * .02),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            if (title == 'name' ||
                                title == 'phone' ||
                                title == 'address')
                              CustomTextFormField(
                                type: title == 'phone'
                                    ? TextInputType.phone
                                    : TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a value';
                                  }
                                  if (title == 'phone' && value.length != 11) {
                                    return 'Phone number must be 11 digits';
                                  }
                                  return null;
                                },
                                title: title,
                                controller: editController,
                                hint: 'Enter the New $title',
                                icon: const Icon(Icons.edit),
                              )
                            else
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Working Days',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
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
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            colors: [
                                              Theme.of(context).primaryColor,
                                              Theme.of(context).primaryColor
                                            ],
                                            tileMode: TileMode.repeated,
                                          ),
                                        ),
                                        onSelect: (values) {
                                          setState(() {
                                            selectedDays = values;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: spacing),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("From",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                      Text("To",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  SizedBox(height: spacing),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        onPressed: () =>
                                            _selectFromTime1(context),
                                        child: Text(
                                          _fromTime1 != null
                                              ? _formatTime(_fromTime1!)
                                              : "Select Time",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            _selectToTime1(context),
                                        child: Text(
                                          _toTime1 != null
                                              ? _formatTime(_toTime1!)
                                              : "Select Time",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: spacing),
                                  CustomTextFormField(
                                    title: 'Examination Time',
                                    controller: editController,
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
                                ],
                              )
                          ],
                        ),
                      ),
                      BlocConsumer<EditAccountViewModel, EditAccountState>(
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
                        },
                        builder: (context, state) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .05),
                            child: CustomElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  if (title != 'name' &&
                                      title != 'phone' &&
                                      title != 'address') {
                                    if (selectedDays.isEmpty) {
                                      DialogeUtils.showMessage(context,
                                          'Please select at least one working day',
                                          posActionTitle: 'Ok');
                                      return;
                                    }
                                    if (_fromTime1 == null) {
                                      DialogeUtils.showMessage(
                                          context, 'Please select a start time',
                                          posActionTitle: 'Ok');
                                      return;
                                    }
                                    if (_toTime1 == null) {
                                      DialogeUtils.showMessage(
                                          context, 'Please select an end time',
                                          posActionTitle: 'Ok');
                                      return;
                                    }
                                  }
                                  if (title == 'address') {
                                    address = editController.text;
                                  } else if (title == 'phone') {
                                    phone = editController.text;
                                  } else if (title == 'name') {
                                    name = editController.text;
                                  } else if (title == 'workDays') {
                                    step = editController.text;
                                    if (_fromTime1 != null) {
                                      startTime =
                                          "${_fromTime1!.hour.toString().padLeft(2, '0')}:${_fromTime1!.minute.toString().padLeft(2, '0')}";
                                    }
                                    if (_toTime1 != null) {
                                      endTime =
                                          "${_toTime1!.hour.toString().padLeft(2, '0')}:${_toTime1!.minute.toString().padLeft(2, '0')}";
                                    }
                                  }
                                  viewModel.editProfile(
                                    phone: phone!,
                                    name: name!,
                                    address: address!,
                                    workdays: selectedDays.toString(),
                                    startTime: startTime!,
                                    endTime: endTime!,
                                    step: step!,
                                  );
                                }
                              },
                              label: "Submit",
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                    ],
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
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  final List<DayInWeek> _days = [
    DayInWeek("Sun", dayKey: 'Sunday'),
    DayInWeek("Mon", dayKey: 'Monday'),
    DayInWeek("Tue", isSelected: true, dayKey: 'Tuesday'),
    DayInWeek("Wed", dayKey: 'Wednesday'),
    DayInWeek("Thu", dayKey: 'Thursday'),
    DayInWeek("Fri", dayKey: 'Friday'),
    DayInWeek("Sat", dayKey: 'Saturday'),
  ];
}
