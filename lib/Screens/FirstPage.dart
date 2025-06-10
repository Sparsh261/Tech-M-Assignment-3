import 'package:fitnesstrackerapp/Screens/Home.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Title(color: Colors.yellow, child: Text("Fitness Tracker App")),
      // ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("fitness.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Fitness Tracker App",
              style: TextStyle(fontSize: 40, color: Colors.yellow, fontWeight: FontWeight.w800),),
              Text("Your personal fitness tracker app",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Home()));
              },
              child: Text("Get Startd", style: TextStyle(color: Colors.white, fontSize: 18),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber)
              ),
              )
            ],)
          ),
        ),
    );
  }}