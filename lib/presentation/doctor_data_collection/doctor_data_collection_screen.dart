import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';

class DoctorDataCollectionScreen extends StatelessWidget {
  DoctorDataCollectionScreen({super.key});
  static const String screenName = "doctot-data-collection-screen";
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcom'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormField(
                title: 'Name',
                controller: _controller,
                hint: 'Name',
                icon: const Icon(Icons.person)),
            CustomTextFormField(
              title: 'Phone Number',
              controller: _controller,
              hint: 'Phone Number',
              icon: const Icon(Icons.phone),
              type: TextInputType.phone,
            ),
            CustomTextFormField(
              title: 'Address',
              controller: _controller,
              hint: 'Address',
              icon: const Icon(Icons.location_on),
            ),
           
          ],
        ),
      ),
    );
  }
}
