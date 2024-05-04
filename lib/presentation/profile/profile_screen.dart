import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account.dart';
import 'package:parkinson_app/presentation/profile/privacy%20policy/privacy_policy_screen.dart';
import 'package:parkinson_app/presentation/profile/setting_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String screenName = "profileScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .05,
                    vertical: MediaQuery.of(context).size.height * .07,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height *
                        .65, // Adjusted height
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
                            child: const Text('Ali Mohamed '),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('AliMohamed123@gmail.com'),
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
                            voidCallback: () {},
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
                            voidCallback: () {},
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
                            voidCallback: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/doctor.png'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
