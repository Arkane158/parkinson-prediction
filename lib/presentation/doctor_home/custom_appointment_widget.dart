import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:parkinson_app/data/model/appointment.dart';

class CustomAppointmentWidget extends StatelessWidget {
  final AppointmentResult appointment;

  const CustomAppointmentWidget({Key? key, required this.appointment})
      : super(key: key);

  String _getMonthName(String? month) {
    if (month == null) {
      return 'Unknown';
    }
    switch (month) {
      case '1':
        return 'January';
      case ' 2':
        return 'February';
      case '3':
        return 'March';
      case '4':
        return 'April';
      case '5':
        return 'May';
      case '6':
        return 'June';
      case '7':
        return 'July';
      case '8':
        return 'August';
      case '9':
        return 'September';
      case '10':
        return 'October';
      case '11':
        return 'November';
      case ' 12':
        return 'December';
      default:
        return 'Unknown';
    }
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            CachedNetworkImageProvider(appointment.img),
                      ),
                      SizedBox(
                        width: size.width * .02,
                      ),
                      Text(
                        appointment
                            .patientName, // You can replace this with the actual patient's name
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            color: Color(0xff757575),
                            size: 25,
                          ),
                          Text(
                            appointment.timeOfDay,
                            style: const TextStyle(
                                color: Color(0xff757575),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xff757575),
                        size: 25,
                      ),
                      Text(
                        '${appointment.dayOfMonth} ${_getMonthName(appointment.month)} ${appointment.year.toString()}',
                        style: const TextStyle(
                            color: Color(0xff757575),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Text(appointment.appointmentStatus)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
