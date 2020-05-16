import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final VoidCallback signOut;
  final String badgenumber;
  final String name;
  final String image;
  final String location;
  final String posisi;
  final String email;
  final String telpon;
  Profile({Key key, @required this.badgenumber, @required this.signOut,
    @required this.name, @required this.image, @required this.location, @required this.posisi, @required this.email, @required this.telpon});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  SignOut(){
    setState(() {
      widget.signOut();
    });
  }
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
                          padding: const EdgeInsets.only(top: 160, left: 5, right: 10),
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
                  color: Colors.white,
                  fontFamily: "Baloo2"
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
                  image: NetworkImage("${widget.image}"),
                  fit: BoxFit.cover,
                )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 180),
          child: new Container(
            child: Text("${widget.name}",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Baloo2"
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 175),
          child: Container(
            child: Icon(Icons.location_on, size: 30, color: Colors.black38,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 85, left: 205),
          child: Container(
            child: Text("${widget.location}",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 18.0,fontWeight: FontWeight.bold, fontFamily: "Baloo2"
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
          padding: const EdgeInsets.only(top: 130,left: 90),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
            height: 40,
            margin: EdgeInsets.all(30),
            child: TextFormField(
              enabled: false,
              controller: TextEditingController()..text = '${widget.name}',
              style: TextStyle(fontFamily: "Baloo2", fontSize: 18),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
                border: InputBorder.none
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 185,left: 90),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
            height: 40,
            margin: EdgeInsets.all(30),
            child: TextFormField(
              enabled: false,
              controller: TextEditingController()..text = '${widget.telpon}',
              style: TextStyle(fontFamily: "Baloo2", fontSize: 18),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, bottom: 15),
                border: InputBorder.none
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 237,left: 90),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
            height: 40,
            margin: EdgeInsets.all(30),
            child: TextFormField(
              enabled: true,
              controller: TextEditingController()..text = '${widget.email}',
              style:  TextStyle(fontFamily: "Baloo2", fontSize: 18),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, bottom: 15),
                border: InputBorder.none
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 290,left: 90),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
            height: 40,
            margin: EdgeInsets.all(30),
            child: TextFormField(
              enabled: false,
              controller: TextEditingController()..text = "${widget.badgenumber}",
              style: TextStyle(fontFamily: "Baloo2", fontSize: 18),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, bottom: 15),
                border: InputBorder.none
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 345,left: 90),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
            height: 40,
            margin: EdgeInsets.all(30),
            child: TextFormField(
              enabled: false,
              controller: TextEditingController()..text = '${widget.posisi}',
              style: TextStyle(fontFamily: "Baloo2", fontSize: 18),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, bottom: 15),
                border: InputBorder.none
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 420, right: 30),
          child: Align(
           alignment: Alignment.bottomRight,
           child: Container(
             child: RaisedButton(
               splashColor: Colors.white,
               color: Colors.red,
               onPressed: (){
                 SignOut();
               },
               child: Text("Logout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Baloo2"),),
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
            child: new Text("Nama :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Baloo2"),),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("No Telp :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Baloo2"),),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Email :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Baloo2"),),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Badgenumber :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Baloo2"),),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Position :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Baloo2"),),
          )
        ],
      ),
    );
  }
}
