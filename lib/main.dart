import 'package:bintang_motor/login.dart';
import 'package:bintang_motor/login2.dart';
import 'package:bintang_motor/mainpage.dart';
import 'package:bintang_motor/navigator_menu.dart';
import 'package:bintang_motor/statistik/chart.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}


