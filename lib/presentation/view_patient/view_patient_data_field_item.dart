import 'package:flutter/material.dart';

class ViewPatientDataFieldItem extends StatelessWidget {
  const ViewPatientDataFieldItem(
      {super.key,
      required this.tittle,
      required this.icon,
      required this.content});
  final String tittle;
  final Icon icon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            tittle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(3.0),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .06,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: icon,
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    content,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff737373)),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
