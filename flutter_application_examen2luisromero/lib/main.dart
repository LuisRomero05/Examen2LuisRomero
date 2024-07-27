//Luis Angel Romero
//20212020532
import 'package:flutter/material.dart';
import 'package:flutter_application_examen2luisromero/yesnopage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen2-Luis Romero',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: YesNoPage(),
    );
  }
}
