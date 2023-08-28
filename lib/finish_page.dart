import 'package:flutter/material.dart';

import 'addpage.dart';
import 'modals/hospital.dart';
class FinishPage extends StatelessWidget {
  final List<Hospital> selectedHospitals;

  const FinishPage({required this.selectedHospitals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: selectedHospitals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Sick Name: ${selectedHospitals[index].name}'),
          );
        },
      ),
    );
  }
}
