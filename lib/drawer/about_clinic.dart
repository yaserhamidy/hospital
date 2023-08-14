import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: about_clinic(),
  ));
}

class about_clinic extends StatelessWidget {
  const about_clinic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Clinic"),backgroundColor: Color(0xff003B73),),
      body: Container(
        color: Color(0xff60A3D9),
        child: Expanded(
          child: Column(
            children: [

              SizedBox(
                height: 30,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("Asset/clinic.jpg"),

                  maxRadius: 100,
                ),
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Information about Clinic",
                  style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,color:
                  Colors.white
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Icon(Icons.info,color: Color(0xffbfd7ed),size: 33,),
                      SizedBox(width: 15,),
                      Expanded(
                        child: Text("Hamidy Specialized Clinic is one of the best clinics in Herat city."
                            " with the best male and female doctors to serve you"

                          ,style: TextStyle(fontSize: 20,color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
             Text("About Doctors",style: TextStyle(
                 fontSize: 30,
                 fontWeight: FontWeight.bold,color:
             Colors.white
             ),),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.man,color: Color(0xffbfd7ed),size: 33,),
                          SizedBox(width: 15,),
                          Expanded(
                            child: Text("Doctor Ibrahim Mahmoudy "

                              ,style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),

                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Icon(Icons.woman,color: Color(0xffbfd7ed),size: 33,),
                          SizedBox(width: 15,),
                          Expanded(
                            child: Text("Doctors Tamana Hamidy "

                              ,style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}