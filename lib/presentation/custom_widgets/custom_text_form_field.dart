import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hint;
  final Icon icon;
  final Validator? validator;
  final bool hideText;
  final TextInputType ?type;

  const CustomTextFormField({
    Key? key,
    this.type=TextInputType.emailAddress,
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
        TextFormField(
          keyboardType:type ,
          obscureText: hideText,
          validator: validator,
          controller: controller,
          style: TextStyle(
              color: Theme.of(context)
                  .primaryColor), // Set text color to primary color
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                color: Theme.of(context)
                    .primaryColor), // Set hint color to primary color with opacity
            prefixIcon: icon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .primaryColor), // Set border color to primary color
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .primaryColor), // Set border color to primary color with opacity
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
          ),
        ),
      ],
    );
  }
}
