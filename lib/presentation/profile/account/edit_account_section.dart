import 'package:flutter/material.dart';

class EditAccountSection extends StatelessWidget {
  const EditAccountSection(
      {super.key,
      required this.tittle,
      required this.icon,
      required this.content});
  final String tittle;
  final Icon icon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 18),
      child: Column(
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
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .06,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: const Color(0xff737373))),
              child: Row(
                children: [
                  Expanded(child: icon),
                  Expanded(
                    flex: 6,
                    child: Text(
                      content,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Expanded(flex: 1, child: Icon(Icons.edit)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
