// EditScreen Widget
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/presentation/add_patient/add_patient_screen.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/edit/edit_patient_info/edit_patient_info_screen.dart';
import 'package:parkinson_app/presentation/edit/edit_screen_view_model.dart';
import 'package:parkinson_app/presentation/edit/table_row.dart';
import 'package:parkinson_app/presentation/view_patient/view_patient_screen.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);
  static const String screenName = "editScreen";

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _searchController = TextEditingController();
  late EditViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = EditViewModel();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.getPatientList();
    });

    // Add a listener to the search controller
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        viewModel.getPatientList();
      } else {
        viewModel.findPatient(_searchController.text);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: BlocProvider(
            create: (context) => viewModel,
            child: Column(children: [
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
                      contentPadding: EdgeInsets.all(size.height * .01),
                      filled: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AddPatientScreen.screenName,
                            arguments: EditScreen.screenName);
                      },
                      child: const Icon(
                        Icons.person_add_alt_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Table(children: const [
                // Header row
                TableRow(children: [
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
                        child: Text('Score'),
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
                ])
              ]),
              Expanded(
                child: BlocBuilder<EditViewModel, EditState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ErrorState) {
                      return Center(child: Text(state.errorMessage));
                    } else {
                      return state is SuccessState &&
                              viewModel.patients.isNotEmpty
                          ? ListView.builder(
                              itemCount: viewModel.patients.length,
                              itemBuilder: (context, index) {
                                final patient = viewModel.patients[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ViewPatientScreen.screenName,
                                          arguments: patient);
                                    },
                                    child: TableRowWidget(
                                      age: patient.age.toString(),
                                      name: patient.name,
                                      gender: patient.gender,
                                      patinet: patient.score!,
                                      deleteFun: (_) {
                                        DialogeUtils.showMessage(context,
                                            "Are You sure you want to Delete?",
                                            posActionTitle: 'Ok',
                                            posAction: () {
                                              setState(() {
                                                viewModel
                                                    .deletePatient(patient.id);
                                              });
                                              viewModel.getPatientList();
                                            },
                                            negActionTitle: 'Cancel',
                                            negAction: () {
                                              Navigator.pop(context);
                                            });
                                      },
                                      editFun: (_) {
                                        Navigator.pushNamed(context,
                                            EditPatientInfoScreen.screenName,
                                            arguments:
                                                viewModel.patients[index]);
                                      },
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(child: Text("No patients found"));
                    }
                  },
                ),
              ),
            ])));
  }
}
