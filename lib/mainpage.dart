import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          //CONTAINER UNTUK BACKGROUND ATAS
          Container(
            height: 230.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),fit: BoxFit.cover
              ),
            ),
            //UNTUK FOTO PROFILE DAN LOGO
            child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 40, right: 270),
                child: Text("LOGO"),
              ),
              new Expanded(
                  child: new Column(
                    children: <Widget>[
                      new Icon(Icons.notifications),
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 70, right: 15, left: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60.0, height: 60.0,
                      decoration: BoxDecoration(
                          shape:BoxShape.circle,
                          image: DecorationImage(
                              image: new AssetImage("assets/picture.jpg"),fit: BoxFit.cover
                          )
                      ),
                    ),
                    new Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text("Hai, Selamat Datang", style: new TextStyle(fontSize: 12.0, color: Colors.white),),
                              new Text("Biber", style: new TextStyle(fontSize: 18.0,color: Colors.white),)
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
          ),
          //CONTAINER UNTUK BOX
          Container(
            margin: EdgeInsets.only(top: 190,bottom: 410, left: 20, right: 20),
            padding: EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.assignment,color: Colors.black),
                        Text("EXAMPLE",style: TextStyle(fontSize: 9),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.notifications, color: Colors.black,),
                        Text("SAMPLE", style: TextStyle(fontSize: 9),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.access_alarm, color: Colors.black,),
                        Text("SAMPLE", style: TextStyle(fontSize: 9),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[BoxShadow(blurRadius: 10)]
            ),
          ),
        ],
      ),
    );
  }
}





















