import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:parkinson_app/data/model/appointment.dart';

class AppointmentItem extends StatelessWidget {
  final AppointmentResult appointment;
  final void Function(BuildContext)? cancelFun;

  const AppointmentItem(
      {Key? key, required this.appointment, required this.cancelFun})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: cancelFun,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.cancel_outlined,
            label: 'Cancel ',
          ),
        ],
      ),
      child: Table(
        children: [
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                CachedNetworkImageProvider(appointment.img),
                          ),
                          SizedBox(width: size.width * .05),
                          Text(appointment.patientName),
                        ],
                      ),
                      Text(
                        '\t\t  ${appointment.appointmentStatus}',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
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
      ),
    );
  }
}
