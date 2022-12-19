import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(primaryColor: Colors.brown),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        elevation: 30,
        shadowColor: Colors.brown[300],
        centerTitle: true,
        title: Text("EVENT SCHEDULER APP",
          style:  GoogleFonts.montserrat(
              fontWeight: FontWeight.w500
          ),

        ),
        backgroundColor: Colors.brown[800],
      ),
      body: Center(
          child: Container(
            height: 40,
            width: 350,
            color: Colors.brown[400],
            child: Center(
              child: Text("EVENT SCHEDULER APP",
                style:  GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 30,
        backgroundColor: Colors.brown[800],
        onPressed: (){},
        hoverElevation: 10,
        child: Icon(Icons.add),
      ),
    );
  }
}