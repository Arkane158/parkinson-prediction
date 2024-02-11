import 'package:flutter/material.dart';

class CustomHomeCategory extends StatelessWidget {
  final String assetPath;
  final String label;
  const CustomHomeCategory(
      {super.key, required this.assetPath, required this.label});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .12,
      width: size.width * .45,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ImageIcon(
                AssetImage(
                  assetPath,
                ),
                size: 50,
                color: Colors.white,
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
