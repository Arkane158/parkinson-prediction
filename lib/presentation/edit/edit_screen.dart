import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/add_patient/add_patient_screen.dart';
import 'package:parkinson_app/presentation/edit/table_row.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);
  static const String screenName = "editScreen";

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * .03,
              horizontal: size.width * .03,
            ),
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              elevation: 2,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  contentPadding: EdgeInsets.all(
                    size.height * .01,
                  ),
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: 'Search',
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Patients',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Set border radius here
                    ),
                    backgroundColor: Theme.of(context)
                        .primaryColor, // Set background color to primary color
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AddPatientScreen.screenName);
                  },
                  child: const Icon(Icons.person_add_alt_sharp),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * .03),
                child: Column(
                  children: [
                    Table(
                      children: const [
                        // Header row
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Name'),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Gender'),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Patient'),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Age'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Jane',
                      gender: 'Female',
                      patinet: "yes",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                    const TableRowWidget(
                      age: '21',
                      name: 'Ahmed',
                      gender: 'Male',
                      patinet: "no",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
