import 'package:bintang_motor/customer/customer.dart';
import 'package:bintang_motor/main.dart';
import 'package:bintang_motor/mainpage.dart';
import 'package:bintang_motor/notification.dart';
import 'package:bintang_motor/pricelist/pricelist.dart';
import 'package:bintang_motor/profile.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: NavigatorPage(),
    );
  }
}

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {

  int _selectedPage = 0;
  final _pageOption = [
    MainPage(),
    Notifikasi(),
    Profile(),
    Customer(),
    PriceList(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pageOption[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text("Notifikasi"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              title: Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}


