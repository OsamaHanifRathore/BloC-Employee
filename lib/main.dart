import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'My Employee Data',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    debugShowCheckedModeBanner: false,
    home: Home(),
    );
  }


}