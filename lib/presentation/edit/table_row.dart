import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TableRowWidget extends StatelessWidget {
  const TableRowWidget(
      {Key? key,
      required this.age,
      required this.name,
      required this.gender,
      required this.patinet,
      required this.deleteFun,
      required this.editFun})
      : super(key: key);

  final String name;
  final String gender;
  final String patinet;
  final String age;
  final void Function(BuildContext)? deleteFun;
  final void Function(BuildContext)? editFun;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFun,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: editFun,
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
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        gender,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        patinet,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        age,
                        textAlign: TextAlign.center,
                      ),
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
