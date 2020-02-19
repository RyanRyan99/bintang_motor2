import 'package:flutter/material.dart';


class CheckStnk extends StatefulWidget {
  @override
  _CheckStnkState createState() => _CheckStnkState();
}
class _CheckStnkState extends State<CheckStnk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
            child: Container(
              color: Colors.white70,
            ),
            width: double.infinity,
            decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background2.png"),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(
            height: 130.0,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.png"),
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
            padding: const EdgeInsets.only(top: 130),
             child: Container(
              color: Colors.white,
              child: new Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: new Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Container(
                            child: Text("Masukan No.Mesin:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7, left: 90),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromRGBO(255, 179, 179, 0.4),
                            ),
                            height: 40,
                            margin: EdgeInsets.only(left: 50, right: 50, bottom: 50),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          left: 310,
                          child: Container(
                            height: 50,
                             child: InkWell(
                              onTap: (){print("CL");},
                              child: Card(
                                color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Icon(Icons.search, size: 35, color: Colors.white,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
                          child: Container(
                            height: 400.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
                            ),
                            child: Column(
                              children: <Widget>[
                                _HeaderCard(),
                                _IsiCard()
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 460, left: 10),
                          child: Container(
                            child: RaisedButton(
                              splashColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              color: Colors.red,
                              onPressed: (){print("c");},
                              child: Text("Hubungi Konsumen",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        _TextField()
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
  Widget _Logo(){
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0),
          child: Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Logo.png")
                )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 105, left: 20),
          child: Container(
            child: Text("Cek STNK",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget _HeaderCard(){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: new Text("Data Pemilik Kendaraan",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: SizedBox(
            height: 1.5,
            width: double.infinity,
            child: new Center(
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget _IsiCard(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Pemilik Kendaraan",
          style: TextStyle(
              color:  Colors.red,
              fontWeight: FontWeight.bold
          ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Type Motor",
            style: TextStyle(
                color:  Colors.red,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("No.Mesin",
            style: TextStyle(
                color:  Colors.red,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("No.Rangka",
            style: TextStyle(
                color:  Colors.red,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Status STNK",
            style: TextStyle(
                color:  Colors.red,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Tgl Terbit STNK",
            style: TextStyle(
                color:  Colors.red,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
  Widget _TextField(){
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 110, left: 135),
          child: Container(
            height: 40,
            width: 200,
            margin: EdgeInsets.all(5),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 158, left: 135),
          child: Container(
            height: 40,
            width: 200,
            margin: EdgeInsets.all(5),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 206, left: 135),
          child: Container(
            height: 40,
            width: 200,
            margin: EdgeInsets.all(5),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 254, left: 135),
          child: Container(
            height: 40,
            width: 200,
            margin: EdgeInsets.all(5),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 302, left: 135),
          child: Container(
            height: 40,
            width: 200,
            margin: EdgeInsets.all(5),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350, left: 135),
          child: Container(
            height: 40,
            width: 200,
            margin: EdgeInsets.all(5),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
      ],
    );
  }
}
