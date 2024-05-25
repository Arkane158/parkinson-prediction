import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String hint;
  final Icon icon;
  final Validator? validator;
  final TextInputType? type;

  const CustomTextFormField({
    Key? key,
    this.type = TextInputType.emailAddress,
    this.validator, // Removed 'required' from here
    required this.title,
    required this.controller,
    required this.hint,
    required this.icon,
  }) : super(key: key);

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hideText = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: height * .015),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 145, 143, 143).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextFormField(
            keyboardType: widget.type,
            obscureText: widget.hint.toLowerCase() == 'password' ||
                    widget.hint.toLowerCase() == 'new password' ||
                    widget.hint.toLowerCase() == 'confirm password'
                ? hideText
                : false,
            validator: widget.validator ?? (value) => null, // Default validator
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hint,
              prefixIcon: widget.icon,
              suffixIcon: widget.hint.toLowerCase() == 'password' ||
                      widget.hint.toLowerCase() == 'new password' ||
                      widget.hint.toLowerCase() == 'confirm password'
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          hideText = !hideText;
                        });
                      },
                      child: hideText
                          ? const Icon(Icons.remove_red_eye_outlined)
                          : const ImageIcon(
                              AssetImage('assets/images/jam_eye-close.png')),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
