import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hint;
  final Icon icon;
  final Validator? validator;
  final bool hideText;
  final TextInputType? type;

  const CustomTextFormField({
    Key? key,
    this.type = TextInputType.emailAddress,
    required this.title,
    this.hideText = false,
    this.validator,
    required this.controller,
    required this.hint,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: height * .015),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 145, 143, 143)
                    .withOpacity(0.5), // Set shadow color and opacity
                spreadRadius: 1, // Set spread radius
                blurRadius: 7, // Set blur radius
                offset: const Offset(0, 3), // Set offset
              ),
            ],
            borderRadius: BorderRadius.circular(
                5), // Set the same border radius as the OutlineInputBorder
          ),
          child: TextFormField(
            keyboardType: type,
            obscureText: hideText,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              fillColor: Colors.white,
              filled: true,
              hintText: hint,
              prefixIcon: icon,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ), // Set border color to primary color
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ), // Set border color to primary color with opacity
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
