import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/doctor_home/app_bar_bottom_nav_bar.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account_view_model.dart';

class ChangePersonalPhoto extends StatefulWidget {
  const ChangePersonalPhoto({super.key});
  static const String screenName = "changePersonalPhoto";

  @override
  State<ChangePersonalPhoto> createState() => _ChangePersonalPhotoState();
}

class _ChangePersonalPhotoState extends State<ChangePersonalPhoto> {
  final ImagePicker picker = ImagePicker();
  EditAccountViewModel viewModel = EditAccountViewModel();
  File? file;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String img = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Personal Photo'),
      ),
      body: BlocProvider(
        create: (context) => viewModel,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .02, vertical: size.height * .02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * .02),
                child: Center(
                  child: GestureDetector(
                    onTap: () => _showImageSourceBottomSheet(),
                    child: file != null
                        ? CircleAvatar(
                            radius: size.width * .2,
                            backgroundColor: Colors.transparent,
                            backgroundImage: FileImage(file!),
                          )
                        : img.isNotEmpty
                            ? CircleAvatar(
                                radius: size.width * .2,
                                backgroundColor: Colors.transparent,
                                backgroundImage: img.startsWith('http')
                                    ? CachedNetworkImageProvider(img)
                                    : FileImage(File(Uri.parse(img).path))
                                        as ImageProvider,
                              )
                            : CircleAvatar(
                                radius: size.width * .2,
                                backgroundColor: Colors.grey,
                                child: const Icon(Icons.person,
                                    color: Colors.white),
                              ),
                  ),
                ),
              ),
              BlocConsumer<EditAccountViewModel, EditAccountState>(
                listener: (context, state) {
                  if (state is LoadingState) {
                    DialogeUtils.showProgressDialog(context, 'Loading...');
                  } else if (state is ErrorState) {
                    DialogeUtils.showMessage(context, state.errorMessage,
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
                    padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (file != null) {
                          // Perform submit action
                          viewModel.editProfileImage(file!);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill all required fields'),
                            ),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showImageSourceBottomSheet() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final myfile = await picker.pickImage(source: source);
    if (myfile == null) return;
    setState(() {
      file = File(myfile.path);
    });
  }
}
