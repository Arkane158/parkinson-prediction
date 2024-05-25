import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkinson_app/data/model/patient.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_icon_button.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/predict/predict_view_model.dart';

class PredictScreenAfterAddingPatient extends StatefulWidget {
  const PredictScreenAfterAddingPatient({Key? key}) : super(key: key);
  static const String screenName = "predictionScreenAfterAddingPatient";

  @override
  State<PredictScreenAfterAddingPatient> createState() =>
      _PredictScreenAfterAddingPatientState();
}

class _PredictScreenAfterAddingPatientState
    extends State<PredictScreenAfterAddingPatient> {
  late Patient patient;
  PredictViewModel viewModel = PredictViewModel();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  void _showImageSourceActionSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(
    ImageSource source,
  ) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _updateSelectedImage(File(pickedFile.path));
      viewModel.predict(
          _selectedImage!, patient.id); // Call predict method here
    } else {
      _showSnackBar('No image selected.');
    }
  }

  void _updateSelectedImage(File selectedImage) {
    setState(() {
      _selectedImage = selectedImage;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    patient = ModalRoute.of(context)?.settings.arguments as Patient;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Prediction'),
      ),
      body: BlocProvider(
        create: (context) => viewModel,
        child: BlocConsumer<PredictViewModel, PredictState>(
          listener: (context, state) {
            if (state is LoadingState) {
              DialogeUtils.showProgressDialog(context, 'Loading...');
            } else if (state is ErrorState) {
              DialogeUtils.showMessage(context, state.errorMessage,
                  posActionTitle: 'Ok');
            } else if (state is SuccessState) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/prediction_result.png',
                        height: 100, // Adjust height as needed
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Prediction Result\n ${state.message}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            } else if (state is HideLoadingState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .05),
                          child: Column(
                            children: [
                              const Image(
                                image: AssetImage(
                                    'assets/images/prediction_logo.png'),
                              ),
                              Text(
                                'Welcome Doctor!',
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(
                                height: size.height * .03,
                              ),
                              const Center(
                                child: Text(
                                  "If you want to know whether a person has \nParkinson's disease or not, you have to make him \ndraw a spiral drawings or wave ",
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                height: size.height * .05,
                              ),
                              if (_selectedImage != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Image.file(
                                    _selectedImage!,
                                    width: size.width * 0.8,
                                    height: size.height * 0.4,
                                  ),
                                ),
                              SizedBox(
                                height: size.height * .05,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .03),
                                child: CustomElevatedIconButton(
                                  onPressed: _showImageSourceActionSheet,
                                  label: 'Upload Photo',
                                  icon: const ImageIcon(
                                    AssetImage(
                                        'assets/images/upload_audio_icon.png'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .05,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
