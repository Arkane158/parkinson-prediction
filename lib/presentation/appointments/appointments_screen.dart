import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:parkinson_app/presentation/appointments/appointment_item.dart';
import 'package:parkinson_app/presentation/appointments/appointments_view_model.dart';

class AppointmentsScreen extends StatefulWidget {
  static const String screenName = "appointments";

  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  late AppointmentViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = AppointmentViewModel();
    viewModel.getAppointment(); // Initial fetch
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => viewModel,
        child: Column(
          children: [
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                setState(() {
                  viewModel.setSelectedDate(selectedDate);
                  viewModel
                      .getAppointment(); // Fetch appointments for selected date
                });
              },
              activeColor: Theme.of(context).primaryColor,
              dayProps: EasyDayProps(
                inactiveDayStyle: DayStyle(
                  dayNumStyle: const TextStyle(
                    color: Color(0xff888888),
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffE0E0E0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
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
            Expanded(
              child: BlocBuilder<AppointmentViewModel, AppointmentState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ErrorState) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is SuccessState) {
                    return ListView.builder(
                      itemCount: viewModel.appointments.length,
                      itemBuilder: (context, index) {
                        final appointment = viewModel.appointments[index];
                        return AppointmentItem(appointment: appointment);
                      },
                    );
                  } else {
                    return const Center(child: Text('No appointments found'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
