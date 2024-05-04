import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account_section.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({super.key});
  static const String screenName = "EditAccount";

  @override
  Widget build(BuildContext context) {
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
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .02),
            child: const Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/d.jpg'),
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
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EditAccountSection(
                    tittle: 'User Name',
                    icon: Icon(Icons.person_outline),
                    content: 'Ali mohamed',
                  ),
                  EditAccountSection(
                    tittle: 'Email',
                    icon: Icon(Icons.person_outline),
                    content: 'AliMohamed123@gmail.com',
                  ),
                  EditAccountSection(
                    tittle: 'Phone ',
                    icon: Icon(Icons.person_outline),
                    content: '01124568875',
                  ),
                  EditAccountSection(
                    tittle: 'Working Days ',
                    icon: Icon(Icons.person_outline),
                    content: 'Sat : thu at 10:00am to 06:00pm ',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
