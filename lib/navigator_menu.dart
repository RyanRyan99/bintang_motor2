import 'package:bintang_motor/mainpage.dart';
import 'package:bintang_motor/notification.dart';
import 'package:bintang_motor/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  final String user;
  NavigatorPage({Key key, @required this.user}) : super (key: key);
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}
class _NavigatorPageState extends State<NavigatorPage> {
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.getString('user');
    });
  }
  var m = <String>[];
  int _selectedPage = 0;
  final _pageOption = [
    MainPage(null),
    Notifikasi(),
    Profile(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getData();
  }

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


