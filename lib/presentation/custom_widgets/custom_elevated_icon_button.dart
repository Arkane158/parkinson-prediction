import 'package:flutter/material.dart';

class CustomElevatedIconButton extends StatelessWidget {
  const CustomElevatedIconButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Widget icon;

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
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: icon,
          label: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.transparent, // Set button's color to transparent
            elevation: 0, // Remove any elevation shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30), // Add padding around the label and icon
          ),
        ),
      ),
    );
  }
}
