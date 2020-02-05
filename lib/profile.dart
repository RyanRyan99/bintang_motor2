import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: new Stack(
          children: <Widget>[
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:AssetImage("assets/background.png"),
                    fit: BoxFit.cover,
                )
              ),
              child: new Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Logo.png"),
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, left: 20),
                    child: Container(
                      child: Text("Statistik",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 145.0, left: 40.0),
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/profile.jpg"),
                      fit: BoxFit.cover,
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170.0, left: 180),
              child: new Container(
                  child: Text("Bruce Wayne",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200, left: 180),
              child: Container(
                child: Icon(Icons.location_on, size: 30, color: Colors.black38,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 205, left: 210),
              child: Container(
                child: Text("Cibinong",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18.0,fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 270.0,),
              child: Container(
                child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SizedBox(
                    height: 10.0,
                    child: new Center(
                      child: new Container(
                        margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                        height: 3.0,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 20.0),
                      child: new Text("Nama",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 15.0, right: 8.0, bottom: 20.0),
                      child: new Text("No Telp",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 15.0, bottom: 20.0),
                      child: new Text("Email",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 25.0, right: 8.0, bottom: 20.0),
                      child: new Text("Password",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 20.0),
                      child: new Text("Confirm",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
