import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:parkinson_app/presentation/add_patient/add_patient_screen.dart';

class TableRowWidget extends StatelessWidget {
  const TableRowWidget({
    Key? key,
    required this.age,
    required this.name,
    required this.gender,
    required this.patinet,
  }) : super(key: key);

  final String name;
  final String gender;
  final String patinet;
  final String age;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Slidable(
        key: const ValueKey(0), // Specify a key if the Slidable is dismissible.
        startActionPane: ActionPane(
          // The start action pane is the one at the left or the top side.
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            // Start actions

            SlidableAction(
              onPressed: (_) {
                // Add your delete action functionality here
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        endActionPane: ActionPane(
          // The end action pane is the one at the right or the bottom side.
          motion: const ScrollMotion(),
          children: [
            // End actions
            SlidableAction(
              onPressed: (_) {
                Navigator.pushNamed(context, AddPatientScreen.screenName);
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
            ),
          ],
        ),
        child: Table(
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(name),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(gender),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(patinet),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(age),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
