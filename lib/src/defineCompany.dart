import 'package:flutter/material.dart';

class DefineCompany extends StatefulWidget {
  createState() {
    return DefineCompanyState();
  }
}

class DefineCompanyState extends State<DefineCompany> {
  int counter = 0;  

  Widget build (context) {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Lets see images'),
      ),
      body: Text('hello'),      
    )
  );
  }
}