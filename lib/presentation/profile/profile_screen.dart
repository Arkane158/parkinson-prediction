import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';
import 'package:parkinson_app/presentation/profile/about_us/about_us_screen.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account.dart';
import 'package:parkinson_app/presentation/profile/help/help_screen.dart';
import 'package:parkinson_app/presentation/profile/privacy%20policy/privacy_policy_screen.dart';
import 'package:parkinson_app/presentation/profile/setting_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String screenName = "profileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? img;
  String? name;
  String? email;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    String? imageUrl = await DoctorPreference.getUserImg();
    String? doctorName = await DoctorPreference.getUserName();
    String? doctoremail = await DoctorPreference.getUserEmail();
    name = doctorName;
    email = doctoremail;
    setState(() {
      img = imageUrl != null && imageUrl.isNotEmpty
          ? convertDriveLink(imageUrl)
          : null;
    });
  }

  String convertDriveLink(String originalLink) {
    return originalLink;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .33,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .05,
                    vertical: MediaQuery.of(context).size.height * .15,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .65,
                    width: MediaQuery.of(context).size.width * 2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .06,
                            ),
                            child: name == null
                                ? const CircularProgressIndicator()
                                : Text(
                                    name!,
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: email == null
                                ? const CircularProgressIndicator()
                                : Text(
                                    email!,
                                  ),
                          ),
                          SettingWidgets(
                            leading: const Icon(
                              Icons.perm_contact_calendar_outlined,
                              color: Color(0xff41545E),
                              size: 40,
                            ),
                            action: const Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                              color: Color(0xff41545E),
                            ),
                            title: 'Account',
                            voidCallback: () {
                              Navigator.pushNamed(
                                  context, EditAccount.screenName);
                            },
                          ),
                          SettingWidgets(
                            leading: const Icon(
                              Icons.lock_person_outlined,
                              color: Color(0xff41545E),
                              size: 40,
                            ),
                            action: const Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                              color: Color(0xff41545E),
                            ),
                            title: 'Privacy Policy',
                            voidCallback: () {
                              Navigator.pushNamed(
                                  context, PrivacyPolicyScreen.screenName);
                            },
                          ),
                          SettingWidgets(
                            leading: const Icon(
                              Icons.info_outline_rounded,
                              color: Color(0xff41545E),
                              size: 40,
                            ),
                            action: const Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                              color: Color(0xff41545E),
                            ),
                            title: 'About us',
                            voidCallback: () {
                              Navigator.pushNamed(
                                  context, AboutUsScreen.screenName);
                            },
                          ),
                          SettingWidgets(
                            leading: const Icon(
                              Icons.help_outline_rounded,
                              color: Color(0xff41545E),
                              size: 40,
                            ),
                            action: const Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                              color: Color(0xff41545E),
                            ),
                            title: 'Help & Support',
                            voidCallback: () {
                              Navigator.pushNamed(
                                  context, HelpScreen.screenName);
                            },
                          ),
                          SettingWidgets(
                            leading: const Icon(
                              Icons.logout_rounded,
                              color: Color(0xff41545E),
                              size: 40,
                            ),
                            action: const Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                              color: Colors.transparent,
                            ),
                            title: 'Logout',
                            voidCallback: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.screenName);
                              logout();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (img != null && img!.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            backgroundColor: Colors.black,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: CachedNetworkImage(
                                imageUrl: img!,
                                fit: BoxFit.contain,
                                width: double.infinity,
                                height: double.infinity,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: img != null && img!.isNotEmpty
                        ? CircleAvatar(
                            radius: size.width * .2,
                            backgroundColor: Colors.transparent,
                            backgroundImage: CachedNetworkImageProvider(img!),
                          )
                        : CircleAvatar(
                            radius: size.width * .2,
                            backgroundColor: Colors.grey,
                            child:
                                const Icon(Icons.person, color: Colors.white),
                          ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  logout() async {
    DoctorPreference.clearUserData();
  }
}
