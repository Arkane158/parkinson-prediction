import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';
import 'package:parkinson_app/presentation/add_patient/add_patient_screen.dart';
import 'package:parkinson_app/presentation/doctor_home/custom_appointment_widget.dart';
import 'package:parkinson_app/presentation/doctor_home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? img;
  String? name;
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    loadImage();
    viewModel.getAppointment();
  }

  Future<void> loadImage() async {
    String? doctorImage = await DoctorPreference.getUserImg();
    String? doctorName = await DoctorPreference.getUserName();
    setState(() {
      img = doctorImage;
      name = doctorName;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocProvider(
        create: (context) => viewModel,
        child: Column(
          children: [
            Container(
              height: size.height * .1,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 2.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (img != null && img!.isNotEmpty)
                          CircleAvatar(
                            radius: size.width * .08,
                            backgroundColor: Colors.transparent,
                            backgroundImage: CachedNetworkImageProvider(img!),
                            child: img == null
                                ? const Icon(Icons.person, color: Colors.white)
                                : null,
                          )
                        else
                          CircleAvatar(
                            radius: size.width * .05,
                            backgroundColor: Colors.grey,
                            child:
                                const Icon(Icons.person, color: Colors.white),
                          ),
                        SizedBox(width: size.width * .025),
                        name == null
                            ? const CircularProgressIndicator()
                            : Text(
                                name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: Colors.white),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * .02),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: size.height * .22,
                          width: size.width * .95,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/doctorhome.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * .02,
                                  horizontal: size.width * .03,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Welcome!',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: size.height * .005),
                                    const Text(
                                      'Thanks for joining with us \nyou can make prediction \nfor patient',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: size.height * .01),
                                    InkWell(
                                      onTap: () => Navigator.pushNamed(
                                          context, AddPatientScreen.screenName),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 12),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: const BorderRadius.all(
                                            Radius.elliptical(10, 15),
                                          ),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: const Text(
                                          'Predict',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Appointments : ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<HomeViewModel, HomeState>(
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is ErrorState) {
                          return Center(child: Text(state.errorMessage));
                        } else if (state is SuccessState) {
                          // Only show the first 5 appointments
                          final appointmentsToShow =
                              viewModel.appointments.take(5).toList();
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: appointmentsToShow.length,
                            itemBuilder: (context, index) {
                              final appointment = appointmentsToShow[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: CustomAppointmentWidget(
                                    appointment: appointment),
                              );
                            },
                          );
                        } else {
                          return const Center(
                              child: Text('No appointments found'));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
