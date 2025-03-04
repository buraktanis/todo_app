import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/todoitem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> todo = ["Study Lesson", "Run 5K", "Go to party"];
List<String> completed = ["Game meetup", "Take out trash"];

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;


    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              //Header
              Container(
              width: deviceWidth,
              height: deviceHeight / 4,
              decoration: const BoxDecoration(
                  color: Colors.purple,
                image: DecorationImage(image: AssetImage("lib/assets/images/header.png"),
                fit: BoxFit.cover
                )
              ),
              child:const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:20),
                    child: Text("October 20, 2023", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,

                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:20),
                    child: Text("My Todo List" ,style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    )),
                  )
                ],
              ),
            ),
              //Top column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: todo.length,
                        itemBuilder: (context, index) {
                      return  Todoitem(title : todo[index]);
                        },
                        ),
                  ),
                ),
              ),
              //Completed text
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child:  Align(
                  alignment: Alignment.centerLeft,
                    child:
                    Text("Completed", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
              ),
              // Bottom column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: completed.length,
                      itemBuilder: (context, index) {
                        return  Todoitem(title : completed[index]);
                      },
                    ),
                  ),
                ),
              ),

              ElevatedButton(onPressed: () {}, child:const Text("Add New Task"))
            ]
          ),
        ),
      ),
    );
  }
}

