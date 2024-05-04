import 'package:flutter/material.dart';

class SettingWidgets extends StatelessWidget {
  final Widget leading;
  final Widget action;
  final String title;
  final VoidCallback voidCallback;

  const SettingWidgets({
    super.key,
    required this.leading,
    required this.action,
    required this.title,
    required this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: voidCallback,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            children: [
              leading,
              const SizedBox(width: 20.0),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              action,
            ],
          ),
        ),
      ),
    );
  }
}
