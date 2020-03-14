import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Notifikasi extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  Widget build(BuildContext context) {
    window.physicalSize;
    window.physicalSize;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double height1 = height - padding.top - padding.bottom;
    double height2 = height - padding.top;
    double height3 = height - padding.top - kToolbarHeight;
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
            child: Container(
              color: Colors.white70,
            ),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background2.png"),
                fit: BoxFit.cover
              ),
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
              padding: const EdgeInsets.only(top: 130.0),
               child: Container(
                height: MediaQuery.of(context).size.height/1.4,
                child: Row(
                  children: <Widget>[
                    _CardNotifilasi()
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(blurRadius: 8)
                  ]
                ),
              ),
            ),
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
            child: Text("Notifikasi",
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
  Widget _CardNotifilasi(){
    window.physicalSize;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
           Card(
             child: new Stack(
               children: <Widget>[
                 Container(
                   width: width,
                   child: Row(
                     children: <Widget>[
                       Padding(
                         padding: EdgeInsets.all(8.0),
                         child: Container(
                           padding: EdgeInsets.all(8.0),
                           child: Column(
                             children: <Widget>[
                               new Text("2020",style: TextStyle(color: Colors.white,fontSize: 11, fontWeight: FontWeight.bold),),
                               new Text("15",style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),),
                               new Text("FEB",style: TextStyle(color: Colors.white,fontSize: 11, fontWeight: FontWeight.bold),),
                             ],
                           ),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8.0),
                               color: Colors.red
                           ),
                         ),
                       ),
                        Container(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             Container(
                               width:200,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   new Text("Budi Setiawan",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                   new Text("Honda BeAT Sporty",style: TextStyle(color: Colors.black38,fontSize: 14, fontWeight: FontWeight.bold),),
                                   new Text("CASH",style: TextStyle(color: Colors.red,fontSize: 14, fontWeight: FontWeight.bold),)
                                 ],
                               ),
                             ),
                           ],
                         ),
                       )
                     ],
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, right: 8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 30,
                        width: 70,
                         child: RaisedButton(
                          splashColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          color: Colors.red,
                          child: Text("Accept",style: TextStyle(color: Colors.white, fontSize: 11),),
                          onPressed: (){},
                        ),
                      ),
                    ),
                  )
               ],
             ),
           ),

          ],
        ),
      ),
    );
  }
}
