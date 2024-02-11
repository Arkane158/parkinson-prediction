import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        height: MediaQuery.of(context).size.height * .07,
        width: MediaQuery.of(context).size.width * 1.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Theme.of(context).primaryColor,
              const Color.fromARGB(255, 79, 175, 175),
              const Color.fromARGB(255, 32, 187, 187),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ), // Set the button's color to transparent
            elevation: 0, // Remove any elevation shadow
          ),
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
