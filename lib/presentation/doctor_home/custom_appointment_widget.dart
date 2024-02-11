import 'package:flutter/material.dart';

class CustomAppointmentWidget extends StatelessWidget {
  const CustomAppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * .03),
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 240, 236, 236),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    child: Image(
                        image: AssetImage('assets/images/patient_ex.png')),
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  Text(
                    'Ahmed Mohamed ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xff757575),
                        size: 25,
                      ),
                      Text(
                        '15 May 2024',
                        style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: Color(0xff757575),
                        size: 25,
                      ),
                      Text(
                        '2:00PM',
                        style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
