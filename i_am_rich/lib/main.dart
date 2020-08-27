import 'package:flutter/material.dart';

// The main function is the starting point of all our Flutter apps
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("I am Rich"),
        backgroundColor: Colors.blueGrey[900]
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Image.asset('images/diamond.png')
    ),
  )));
}
