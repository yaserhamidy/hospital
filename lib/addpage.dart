import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/home_page.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'modals/hospital.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final _formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();

  final controller = TextEditingController();
  final controllerprice = TextEditingController();
  final controllerinfo = TextEditingController();

  final List<Hospital> hospitals = [];

  DateTime selectedTime = DateTime.now();
  File? _image;

  get isChecked => null;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  String selectedCurrency = "Hamidy";

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in doctors_name) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  List<String> doctors_name = ["Hamidy", "Mahmody"];
  List<Hospital> selectedHospitals = [];
  String userNotes = '';

  @override
  Widget build(BuildContext context) {
    getDropdownItems();
    return Scaffold(
        body: Column(children: <Widget>[
      SizedBox(

      ),
      Center(
          child: Text(
        'Add New',
        style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
      )),
      SizedBox(
        height: 4,
      ),
      Padding(
        padding: EdgeInsets.only(right: 20, left: 20, bottom: 0, top: 8),
        child: Form(
          key: _formKey,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Name';
              }
            },
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.black54,
                  width: 3,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.black54,
                  width: 3,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 3,
                ),
              ),
              labelText: 'Enter name',
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 0, top: 8),
        child: Form(
          key: formKey,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Number';
              }
            },
            controller: controllerprice,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.black54,
                  width: 3,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.black54,
                  width: 3,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 3,
                ),
              ),
              labelText: 'Enter Price',
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 8, top: 8),
        child: TextField(
          controller: controllerinfo,
          onChanged: (value) {
            userNotes = value;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 3,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 3,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.lightBlueAccent,
                width: 3,
              ),
            ),
            labelText: 'Notes about person',
          ),
        ),
      ),
      Expanded(
        child: Row(

          children: [
            SizedBox(width: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Set the border radius
                ),
                splashColor: Colors.blue,
                color: Colors.lightBlueAccent,
                height: 55,
                minWidth: 90,
                child: Text(
                  'Select Time',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedTime,
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedTime)
                    setState(() {
                      selectedTime = picked;
                    });
                },
              ),
            ),

            SizedBox(width: 15,),

            Padding(
              padding: const EdgeInsets.all(8.0),

              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Set the border radius
                ),
                splashColor: Colors.blue,
                height: 55,
                minWidth: 90,
                color: Colors.lightBlueAccent,
                onPressed: () {
                  _getImage();
                },
                child: Container(

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  //   image: _image != null
                  //       ? DecorationImage(
                  //           image: FileImage(_image!),
                  //           fit: BoxFit.cover,
                  //         )
                  //       : null,
                  // ),
                  // child: _image == null
                  //     ? Icon(
                  //         Icons.camera_alt,
                  //         size: 20,
                  //         color: Colors.white,
                  //       )
                  //     : null,

                ),
                  child: Text(
                    'Select Image',
                    style: TextStyle(color: Colors.white),
                  ),
              ),
            ),
            ),

            SizedBox(width: 15,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Set the border radius
                  ),
                  splashColor: Colors.blue,
                  color: Colors.lightBlueAccent,
                  child: Row(
                    children: [
                      Text(
                        "Select doctor",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      SingleChildScrollView(
                        child: DropdownButton(
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            value: selectedCurrency,
                            items: getDropdownItems(),
                            onChanged: (value) async {
                              selectedCurrency = value!;

                              setState(() {});
                            }),
                      ),
                    ],
                  ),
                  onPressed: () {}),
            ),
          ],

        ),
       ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Set the border radius
            ),
            splashColor: Colors.blue,
            height: 50,
            minWidth: 50,
            color: Colors.lightBlueAccent,
            child: Text(
              'Add person',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    hospitals.add(Hospital(
                      name: controller.text,
                      time: selectedTime,
                      imagePath: '',
                      doctorName: selectedCurrency,
                      Price: controllerprice.text,
                      info: controllerinfo.text,
                    ));
                    controller.clear();
                    Navigator.pop(context, hospitals);
                  });
                }
              }
            }),
      ),
    ]));
  }
}
