import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.yellow, child: Text("Fitness Traacker App")),
      ),
    );
  }}