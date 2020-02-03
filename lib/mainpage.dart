import 'package:bintang_motor/customer/customer.dart';
import 'package:bintang_motor/navigator_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(new MaterialApp(
    home: new NavigatorPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: new Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30),
                  child: Container(
                    child: Text("Logo", style: TextStyle(color: Colors.white),),
                  ),
                ),
               Container(
                 padding: EdgeInsets.only(top: 40, left: 300),
                 child: Icon(Icons.notifications, color: Colors.white,),
               ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 20),
                  child: Container(
                    width: 60.0,height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90, left: 90),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Hai, Selamat Datang",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                          ),
                        ),
                        new Text("Bruce Wayne",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Sales Point :",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 90),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("120.000",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            margin: EdgeInsets.only(top: 190.0, left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Column(
                    children: <Widget>[
                      new IconButton(
                          icon: Icon(Icons.dns,color: Colors.red, size: 30,),
                          onPressed: (){
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new Customer()
                            )
                            );
                          },
                      ),
                      new Text("Customer", style: TextStyle(fontSize: 11, color: Colors.red),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0),
                  child: Column(
                    children: <Widget>[
                      new IconButton(
                        icon: Icon(Icons.remove_red_eye,color: Colors.red, size: 30,),
                        onPressed: null,
                      ),
                      new Text("Notifikasi", style: TextStyle(fontSize: 11, color: Colors.red),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0),
                  child: Column(
                    children: <Widget>[
                      new IconButton(
                        icon: Icon(Icons.attach_money,color: Colors.red, size: 30,),
                        onPressed: null,
                      ),
                      new Text("Price List", style: TextStyle(fontSize: 11,color: Colors.red),)
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5.0)]
            ),
          ),
        ],
      ),
    );
  }
}
