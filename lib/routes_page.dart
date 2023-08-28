import 'package:flutter/material.dart';
import 'package:hospital/drawer/about.dart';
import 'package:hospital/drawer/about_clinic.dart';
import 'package:hospital/chatgpt_page.dart';
import 'package:hospital/finish_page.dart';
import 'package:hospital/home_page.dart';
import 'drawer/setting.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'finish_page.dart';



class RoutesPage extends StatefulWidget {
  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

final List<Widget> pages = [
  HomePage(),
  FinishPage(
    selectedHospitals: [],
  ),
  ChatGPT(),
];

class _RoutesPageState extends State<RoutesPage> {
  Widget currentPage = pages[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: Colors.white,
          color: Color(0xff003B73),
          animationDuration: Duration(milliseconds: 300),
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Color(0xFFBFD7ED),
            ),
            Icon(
              Icons.work,
              size: 30,
              color: Color(0xFFBFD7ED),
            ),
            Icon(
              Icons.help_outline_outlined,
              size: 30,
              color: Color(0xFFBFD7ED),
            ),
          ],
          onTap: (indexOfCurrentPage) {
            setState(() {
              currentPage = pages[indexOfCurrentPage];
            });
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          elevation: 0.0,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String value) {
                switch (value) {
                  case 'about':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const about()),
                    );
                  case 'exit':
                    Navigator.pop(context);
                }
              },
              itemBuilder: (BuildContext context) {
                return {'about', 'exit'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
              DrawerHeader(
                child: Container(
                  child: Image.asset("Asset/dentest.jpg"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text(
                  'About',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => about()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: const Text(
                  'Settings',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.local_hospital_rounded),
                title: const Text(
                  'about clinic',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => about_clinic()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: const Text(
                  'exit',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ])),
        backgroundColor: Colors.lightBlueAccent,

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 30.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("Asset/doctor.png"),
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),
                      SizedBox(width: 55),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          child: Text(
                            'کلینیک بزرگ دندان حامدی',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                child: currentPage,
              ),
            )
          ],
        ));
  }
}
