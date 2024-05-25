import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  final String tittle;
  const AuthWidget({super.key, required this.tittle});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * .1,
        ),
        // Image.asset('assets/images/logo.png'),
        Center(
          child: Text(
            tittle,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Theme.of(context).primaryColor,
                fontSize: 40,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: height * .05,
        ),
      ],
    );
  }
}
