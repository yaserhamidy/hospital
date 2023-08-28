import 'package:flutter/material.dart';
import 'package:hospital/addpage.dart';
import 'package:intl/intl.dart';
import 'finish_page.dart';
import 'addpage.dart';
import 'finish_page.dart';
import 'modals/hospital.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final List<Hospital> hospitals = [];

  DateTime selectedTime = DateTime.now();
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

  @override
  Widget build(BuildContext context) {
    getDropdownItems();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () async{
          var result = await showModalBottomSheet(context: context, builder: (context)=> AddScreen());
          print(result);
          hospitals.addAll(result);
          setState(() {

          });
        },

      ),

      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,

              child: MaterialButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirmation'),
                        content: Text('Are you sure you want to delete all?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                hospitals.clear();
                                selectedHospitals.clear();
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Delete All',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: hospitals.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(hospitals[index].imagePath),
                    ),
                    title: Row(
                      children: [
                        Icon(Icons.person,color: Colors.lightBlueAccent),
                        Text("  ${hospitals[index].name}  "),
                        Icon(Icons.attach_money_outlined,color: Colors.lightBlueAccent),
                        Text("  ${hospitals[index].Price} AFG "),

                      ],
                    ),


                    subtitle:

                    Row(
                      children: [
                        Text(
                          DateFormat('yyyy-MM-dd – kk:mm').format(hospitals[index].time),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.local_hospital_outlined,color: Colors.lightBlueAccent,),
                        Text(" ${hospitals[index].doctorName} "),

                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        IconButton(
                          icon: Icon(Icons.info,color: Colors.lightBlueAccent),

                          onPressed: () {

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Person Notes'),
                                  content: Text("${hospitals[index].info} "),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {

                                        Navigator.pop(context);
                                      },
                                      child: Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.lightBlueAccent,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Confirm Delete'),
                                  content: Text('Are you sure you want to delete this item?'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          hospitals.removeAt(index);
                                        });
                                        Navigator.pop(context); // Close the dialog
                                      },
                                      child: Text('Delete'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Close the dialog
                                      },
                                      child: Text('Cancel'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.lightBlueAccent,
                          side: BorderSide(color: Colors.lightBlueAccent),
                          value: hospitals[index].isChecked,
                          onChanged: (value) {
                            setState(() {
                              hospitals[index].isChecked = value!;
                              if (value!) {
                                selectedHospitals.add(hospitals[index]);
                              } else {
                                selectedHospitals.remove(hospitals[index]);
                              }
                              if (value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FinishPage(
                                      selectedHospitals: selectedHospitals,
                                    ),
                                  ),
                                );
                              }
                            });
                          },
                        ),

                      ],
                    )
                  );
                },
              ),
            ),


          ],
        ),
      )
    );
  }
}


