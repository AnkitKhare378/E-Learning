import 'package:e_learning/start.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'start',
    routes: {
      'start': (context)=> StartPage()
    },
  ));
}