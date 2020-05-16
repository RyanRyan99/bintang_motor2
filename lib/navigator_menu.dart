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
  final VoidCallback signOut;
  final String user;
  final String badgenumber;
  final String name;
  final String point;
  final String image;
  final String location;
  final String posisi;
  final String email;
  final String telpon;
  NavigatorPage({Key key, @required this.user,
    @required this.badgenumber, @required this.signOut,
    @required this.name, @required this.point, @required this.image,
    @required this.location, @required this.posisi, @required this.email, @required this.telpon}) : super (key: key);
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}
class _NavigatorPageState extends State<NavigatorPage> {
  SignOut(){
    setState(() {
      widget.signOut();
    });
  }
  @override
  int _selectedPage = 0;
  String userID;
  var page;
  @override
  void initState() {
    super.initState();
    userID = widget.user;
    final _pageOption = [
      MainPage(user: widget.user, name: widget.name, point: widget.point, image: widget.image,),
      Notifikasi(),
      Profile(signOut: SignOut, name: widget.name, location: widget.location, image: widget.image, badgenumber: widget.badgenumber, posisi: widget.posisi, email: widget.email, telpon: widget.telpon,),
    ];
    page = _pageOption;
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
                  body: page[_selectedPage],
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
                      title: Text("Home", style: TextStyle(fontFamily: "Baloo2"),)
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
                        title: Text("Notifikasi", style: TextStyle(fontFamily: "Baloo2"),)
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
                        title: Text("Profile", style: TextStyle(fontFamily: "Baloo2"),)
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


