import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';
import 'package:parkinson_app/presentation/doctor_home/custom_appointment_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState(); // Change _HomeScreenState to HomeScreenState
}

class _HomeScreenState extends State<HomeScreen> {
  String? img; // Initialize to null

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    String? imageUrl = await DoctorPreference.getUserImg();
    setState(() {
      img = imageUrl != null && imageUrl.isNotEmpty
          ? _getDirectImageUrl(imageUrl)
          : null;
    });
  }

  String _getDirectImageUrl(String driveLink) {
    final regExp = RegExp(r'\/d\/(.*?)\/');
    final match = regExp.firstMatch(driveLink);
    if (match != null) {
      final fileId = match.group(1);
      return 'https://drive.google.com/uc?export=view&id=$fileId';
    }
    return driveLink; // Return the original link if it doesn't match the pattern
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Non-scrollable part
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
                              if (img != null && img!.isNotEmpty)
                                CircleAvatar(
                                  radius: size.width * .05,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: img != null
                                      ? CachedNetworkImageProvider(img!)
                                      : null,
                                  child: img == null
                                      ? const Icon(Icons.person,
                                          color: Colors.white)
                                      : null,
                                )
                              else
                                CircleAvatar(
                                  radius: size.width * .05,
                                  backgroundColor: Colors.grey,
                                  child: const Icon(Icons.person,
                                      color: Colors.white),
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
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: const BorderRadius.all(
                                          Radius.elliptical(5, 5),
                                        ),
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
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
                          ),
                        ],
                      ),
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
