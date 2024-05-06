import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/doctor_home/custom_appointment_widget.dart';
import 'package:parkinson_app/presentation/doctor_home/custom_home_category.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Non-scrollable part
            Container(
              height: size.height * .16,
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
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                minRadius: 1.0,
                                child: Image.asset('assets/images/doctor.png'),
                              ),
                              SizedBox(
                                width: size.width * .025,
                              ),
                              Text(
                                'Ali Mohamed',
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
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                    child: Material(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      elevation: 2,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.all(size.height * .01),
                          filled: true,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          hintText: 'Search',
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Scrollable part
            SizedBox(
              height: size.height * 0.84, // Adjust the height as needed
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * .02),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: size.height * .19,
                          width: size.width * .95,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/doctorhome.png'))),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * .02,
                                    horizontal: size.width * .03),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Welcome!',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      height: size.height * .005,
                                    ),
                                    const Text(
                                      'Thanks for joining with us \nyou can make prediction \nfor patient',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      height: size.height * .01,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: const BorderRadius.all(
                                              Radius.elliptical(5, 5)),
                                          color:
                                              Theme.of(context).primaryColor),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          'Predict',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .04),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'categories',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * .03),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomHomeCategory(
                                  assetPath:
                                      'assets/images/home_patient_icon.png',
                                  label: 'Patients',
                                ),
                                CustomHomeCategory(
                                  assetPath:
                                      'assets/images/home_healthy_icon.png',
                                  label: 'Healthy People',
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Appointments ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'See All ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .03),
                      child: Column(
                        children: [
                          const CustomAppointmentWidget(),
                          const CustomAppointmentWidget(),
                          const CustomAppointmentWidget(),
                          SizedBox(
                            height: size.height * .04,
                          )
                        ],
                      ),
                    )
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
