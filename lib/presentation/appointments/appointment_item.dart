import 'package:flutter/material.dart';
import 'package:parkinson_app/data/model/appointment.dart';

class AppointmentItem extends StatelessWidget {
  final Appointment appointment;

  const AppointmentItem({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Table(
      children: [
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/patient_ex1.png'),
                    ),
                    SizedBox(width: size.width * .05),
                    const Text('John Doe'),
                  ],
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * .02,
                    vertical: size.height * .03,
                  ),
                  child: Text(
                    appointment.timeOfDay,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        // Add more rows as needed
      ],
    );
  }
}
