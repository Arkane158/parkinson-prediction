import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/appointments/appointments_screen.dart';
import 'package:parkinson_app/presentation/doctor_home/home_screen.dart';
import 'package:parkinson_app/presentation/edit/edit_screen.dart';
import 'package:parkinson_app/presentation/predict/predict_screen_before_add_patient.dart';
import 'package:parkinson_app/presentation/profile/profile_screen.dart';

class AppBarAndBottomNav extends StatefulWidget {
  const AppBarAndBottomNav({
    super.key,
  });
  static const String screenName = "doctorHomeScreen";

  @override
  State<AppBarAndBottomNav> createState() => _AppBarAndBottomNavState();
}

class _AppBarAndBottomNavState extends State<AppBarAndBottomNav> {
  int currentIndex = 0;
  String _title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: currentIndex == 0
              ? const Size.fromHeight(20.0)
              : const Size.fromHeight(
                  60.0), // Adjust the preferred size based on currentIndex
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text(_title),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (selectedIndex) {
              setState(() {
                switch (selectedIndex) {
                  case 0:
                    _title = '';
                    break;
                  case 1:
                    _title = 'Edit';
                    break;
                  case 2:
                    _title = 'Predict';
                    break;
                  case 3:
                    _title = 'Appointments';
                    break;
                  case 4:
                    _title = 'Profile';
                    break;
                  default:
                    _title = 'home';
                    break;
                }

                currentIndex = selectedIndex;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/edit.png')),
                  label: 'Edit'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/predict.png')),
                  label: 'Predict'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/appointments_icon.png')),
                  label: 'Appointments'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Profile'),
            ]),
        body: tabs[currentIndex]);
  }

  List<Widget> tabs = [
    const HomeScreen(),
    const EditScreen(),
    const PredictScreenBeforeAddingPatient(),
    const AppointmentsScreen(),
    const ProfileScreen(),
  ];
}
