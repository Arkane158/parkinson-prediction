import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/profile/account/edit/change_account_data_screen.dart';
import 'package:parkinson_app/presentation/profile/account/edit/change_img_screen.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account_section.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});
  static const String screenName = "EditAccount";

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  String? img;
  String? name;
  String? email;
  String? phone;
  String? workDays;
  String? startTime;
  String? endTime;
  String? address;
  String? step;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String? imageUrl = await DoctorPreference.getUserImg();
    String? doctorName = await DoctorPreference.getUserName();
    String? doctorEmail = await DoctorPreference.getUserEmail();
    String? doctorPhone = await DoctorPreference.getUserPhone();
    String? doctorWorkDays = await DoctorPreference.getUserWorkdays();
    String? doctorStartTime = await DoctorPreference.getUserStartTime();
    String? doctorEndTime = await DoctorPreference.getUserEndTime();
    String? doctorStep = await DoctorPreference.getUserStep();
    String? doctorAddress = await DoctorPreference.getUserAddress();
    setState(() {
      img = imageUrl != null && imageUrl.isNotEmpty
          ? convertDriveLink(imageUrl)
          : null;
      name = doctorName;
      email = doctorEmail;
      phone = doctorPhone;
      workDays = doctorWorkDays;
      startTime = doctorStartTime;
      endTime = doctorEndTime;
      step = doctorStep;
      print(startTime);
      print('hi');
      print(endTime);
      address = doctorAddress;
    });
  }

  String convertDriveLink(String originalLink) {
    return originalLink;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * .02),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  DialogeUtils.showMessage(
                    context,
                    'Are You Sure u want to Change Personal Photo?',
                    posActionTitle: 'Yes',
                    posAction: () {
                      Navigator.pushNamed(
                          context, ChangePersonalPhoto.screenName,
                          arguments: img!);
                    },
                    negActionTitle: 'No',
                    negAction: () => Navigator.pop(context),
                  );
                },
                child: img != null && img!.isNotEmpty
                    ? CircleAvatar(
                        radius: size.width * .2,
                        backgroundColor: Colors.transparent,
                        backgroundImage: img!.startsWith('http')
                            ? CachedNetworkImageProvider(img!)
                            : FileImage(File(Uri.parse(img!).path))
                                as ImageProvider,
                      )
                    : CircleAvatar(
                        radius: size.width * .2,
                        backgroundColor: Colors.grey,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Account Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  name == null
                      ? const CircularProgressIndicator()
                      : InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ChangeAccountDataScreen.screenName,
                                arguments: 'name');
                          },
                          child: EditAccountSection(
                            tittle: 'User Name',
                            icon: const Icon(Icons.person_outline),
                            content: name!,
                          ),
                        ),
                  email == null
                      ? const CircularProgressIndicator()
                      : EditAccountSection(
                          tittle: 'Email',
                          icon: const Icon(Icons.email_outlined),
                          content: email!,
                        ),
                  phone == null
                      ? const CircularProgressIndicator()
                      : InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ChangeAccountDataScreen.screenName,
                                arguments: 'phone');
                          },
                          child: EditAccountSection(
                            tittle: 'Phone ',
                            icon: const Icon(Icons.phone_enabled_sharp),
                            content: phone!,
                          ),
                        ),
                  workDays == null || startTime == null || endTime == null
                      ? const CircularProgressIndicator()
                      : InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ChangeAccountDataScreen.screenName,
                                arguments: 'workDays');
                          },
                          child: EditAccountSection(
                            tittle: 'Working Days ',
                            icon: const Icon(Icons.calendar_month),
                            content: '$workDays: $startTime to $endTime',
                          ),
                        ),
                  address == null
                      ? const CircularProgressIndicator()
                      : InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ChangeAccountDataScreen.screenName,
                                arguments: 'address');
                          },
                          child: EditAccountSection(
                            tittle: 'address',
                            icon: const Icon(Icons.location_on_outlined),
                            content: 'Address: $address ',
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
