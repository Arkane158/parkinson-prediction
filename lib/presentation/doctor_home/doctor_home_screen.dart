import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/doctor_home/home_screen.dart';
import 'package:parkinson_app/presentation/edit/edit_screen.dart';
import 'package:parkinson_app/presentation/predict/predict_screen.dart';
import 'package:parkinson_app/presentation/profile/profile_screen.dart';

class AppBarAndBottomNav extends StatefulWidget {
  const AppBarAndBottomNav({super.key});
  static const String screenName = "doctorHomeScreen";

  @override
  State<AppBarAndBottomNav> createState() => _AppBarAndBottomNavState();
}

class _AppBarAndBottomNavState extends State<AppBarAndBottomNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (selectedIndex) {
              setState(() {
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
                  icon: Icon(Icons.person_outline), label: 'Profile'),
            ]),
        body: tabs[currentIndex]);
  }

  List<Widget> tabs = [
    HomeScreen(),
    const ProfileScreen(),
    const PredictScreen(),
    const EditScreen(),
  ];
}
