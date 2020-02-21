import 'package:bintang_motor/customer/customer.dart';
import 'package:bintang_motor/information/cek_stnk.dart';
import 'package:bintang_motor/information/news.dart';
import 'package:bintang_motor/main.dart';
import 'package:bintang_motor/mainpage.dart';
import 'package:bintang_motor/notification.dart';
import 'package:bintang_motor/pricelist/pricelist.dart';
import 'package:bintang_motor/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              child: Container(
                color: Colors.white70,
                child: Scaffold(
                  body: _pageOption[_selectedPage],
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background2.png"),
                  fit: BoxFit.cover
                )
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: Colors.white70),
                child: BottomNavigationBar(
                  iconSize: 20,
                  showSelectedLabels: true,
                  selectedLabelStyle: TextStyle(color: Colors.red),
                  unselectedLabelStyle: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
                  unselectedIconTheme: IconThemeData(color: Colors.white70),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.red,
                  currentIndex: _selectedPage,
                  onTap: (int index){
                    setState(() {
                      _selectedPage = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Container(
                        width: 30, height: 30,
                        child: Icon(Icons.home,size: 25),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      title: Text("Home")
                    ),
                    BottomNavigationBarItem(
                        icon: Container(
                          width: 30, height: 30,
                            child: Icon(Icons.error_outline,size: 25),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        title: Text("Notifikasi")
                    ),
                    BottomNavigationBarItem(
                        icon: Container(
                          width: 30, height: 30,
                            child: Icon(Icons.group,size: 25),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        title: Text("Profile")
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


