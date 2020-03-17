import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            child: Container(
              color: Colors.white70,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background2.png"),
                fit: BoxFit.cover
              )
            ),
          ),
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
                _Logo()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130.0),
             child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height/1.4,
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: new Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 160, left: 20, right: 20),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                _TextName()
                              ],
                            ),
                          ),
                        ),
                        _ProfileHeader(),
                        _TextField(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  //Untuk Logo
  Widget _Logo(){
    return Stack(
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
            child: Text("Profile",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
        )
      ],
    );
  }
  //Untuk Profile
  Widget _ProfileHeader(){
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 40.0),
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
          padding: const EdgeInsets.only(top: 50.0, left: 180),
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
          padding: const EdgeInsets.only(top: 75, left: 175),
          child: Container(
            child: Icon(Icons.location_on, size: 30, color: Colors.black38,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 205),
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
          padding: const EdgeInsets.only(top: 140.0,),
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
      ],
    );
  }
  //Untuk Field
  Widget _TextField(){
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 125,left: 80),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 40,
            margin: EdgeInsets.all(30),
            child: TextField(
              style: TextStyle(height: 2.0),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 175,left: 80),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 40,
            margin: EdgeInsets.all(30),
            child: TextField(
              style: TextStyle(height: 2.0),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 222,left: 80),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.black12
            ),
            height: 40,
            margin: EdgeInsets.all(30),
            child: TextField(
              style: TextStyle(height: 2.0),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 270,left: 80),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.black12
            ),
            height: 40,
            margin: EdgeInsets.all(30),
            child: TextField(
              style: TextStyle(height: 2.0),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 318,left: 80),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.black12
            ),
            height: 40,
            margin: EdgeInsets.all(30),
            child: TextField(
              style: TextStyle(height: 2.0),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 400, right: 30),
          child: Align(
           alignment: Alignment.bottomRight,
           child: Container(
             height: 30,
             child: RaisedButton(
               splashColor: Colors.white,
               color: Colors.red,
               onPressed: (){},
               child: Text("Save", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
               shape: RoundedRectangleBorder(
                 borderRadius: new  BorderRadius.circular(20.0),
               ),
             ),
           ),
            ),
        )
      ],
    );
  }
  //Untuk Row Nama
  Widget _TextName(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Nama :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("No Telp :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Email :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Password :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Confirm :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
          )
        ],
      ),
    );
  }
}
