import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: about(),
  ));
}

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Creator"),backgroundColor: Color(0xff003B73),),
      body: Container(
        color: Color(0xff60A3D9),
        child: Column(
          children: [

            SizedBox(
              height: 50,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/IMG_2586.JPG"),
                maxRadius: 100,
              ),
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Information about creator",
                style: TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.bold,color:
                Colors.white
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Icon(Icons.person,color: Color(0xffbfd7ed),size: 33,),
                    SizedBox(width: 15,),
                    Text("Yaser hamidy"

                      ,style: TextStyle(fontSize: 20,color: Colors.white),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Icon(Icons.school,color: Color(0xffbfd7ed),size: 33,),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Text("App developer and a student"
                          " in wassa organization in code 4 fun section"

                        ,style: TextStyle(fontSize: 20,color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}