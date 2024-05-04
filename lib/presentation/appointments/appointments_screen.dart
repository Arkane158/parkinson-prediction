import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  static const String screenName = "appointments";
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            //`selectedDate` the new date selected.
          },
          activeColor: Theme.of(context).primaryColor,
          dayProps: EasyDayProps(
            inactiveDayStyle: DayStyle(
                dayNumStyle: const TextStyle(
                    color: Color(0xff888888),
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
                decoration: BoxDecoration(
                    color: const Color(0xffE0E0E0),
                    borderRadius: BorderRadius.circular(10))),
            landScapeMode: true,
            activeDayStyle: const DayStyle(
              borderRadius: 25,
            ),
            dayStructure: DayStructure.dayStrDayNum,
          ),
          headerProps: const EasyHeaderProps(
            dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * .02, horizontal: size.width * .02),
          child: Table(
            children: [
              const TableRow(
                children: [
                  TableCell(child: Center(child: Text('Name'))),
                  TableCell(child: Center(child: Text('Time'))),
                ],
              ),
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
                          vertical: size.height * .03),
                      child: const Text(
                        '9:00 AM',
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ),
                ],
              ),
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
                          const Text('Jane Smith'),
                        ],
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .02,
                          vertical: size.height * .03),
                      child: const Text('10:30 AM'),
                    )),
                  ),
                ],
              ),
              // Add more rows as needed
            ],
          ),
        )
      ],
    );
  }
}
