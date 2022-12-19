
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List event=[];
  final _controller=TextEditingController();

  void saveNewTask(BuildContext context){
    setState((){
      if((_controller.text).isNotEmpty)
        {
          event.add([_controller.text]);
          _controller.clear();
        }
    });
    Navigator.of(context).pop();
  }

 void CreateNewTask(BuildContext context){
   showDialog(
      context: context,
      builder: (context){
        return DialogueBox(
          controller: _controller,
          onSave: ()=>saveNewTask(context),
          onCancel: ()=>Navigator.of(context).pop(),
        );
      },
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        elevation: 30,
        shadowColor: Colors.black54,
        centerTitle: true,
        title: Text("EVENT SCHEDULER APP",
        style:  GoogleFonts.montserrat(
          fontWeight: FontWeight.w500
         ),
        ),
        backgroundColor: Colors.brown[800],
      ),
      body: ListView.builder(
        itemCount: event.length,
        itemBuilder: (context,index){
          return Events(
            taskName: event[index][0],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 30,
        backgroundColor: Colors.brown[800],
        onPressed: ()=>CreateNewTask(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Events extends StatelessWidget {
  final String taskName;
  const Events({
    super.key,
    required this.taskName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15,right:15,top:20 ),
        child: Container(
          alignment: const Alignment(0,0),
           padding: const EdgeInsets.all(20.0),
           decoration: BoxDecoration(
           color: Colors.brown[400],
           borderRadius: BorderRadius.circular(10),
               boxShadow: const [
               BoxShadow(
                 color: Colors.black,
                 blurRadius: 10,
                 spreadRadius: 0.5,
                 offset: Offset(1,1),
               )
             ]
          ),
           child: Text(taskName,
           style:  GoogleFonts.sora(
             fontWeight: FontWeight.w400,
             fontSize: 15,
           ),
         ),
        )
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      color: Colors.brown[600],
      elevation: 10,
        height: 45,
        minWidth: 100,
        splashColor: Colors.white10,
        child: Text(text,
        style: GoogleFonts.sora(
            fontWeight: FontWeight.w400,
        ),),
    );
  }
}

class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;


  DialogueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.brown[400],
      content: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.brown[400],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                hintText: "Add an event",
                icon: Icon(Icons.calendar_month_outlined),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Button(text: "ADD", onPressed: onSave),
                Button(text: "CANCEL", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
