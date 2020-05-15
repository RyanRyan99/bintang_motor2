import 'package:flutter/material.dart';
import 'album.dart';
import 'package:intl/intl.dart';
class NewsDetail extends StatefulWidget {
  final Album curAlbum;
  NewsDetail({@required this.curAlbum});
  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: new Stack(
            children: <Widget>[
              Container(
                height: 410,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.curAlbum.images),
                      fit: BoxFit.cover,
                    )
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        colors: [
                          Colors.black38.withOpacity(.8),
                          Colors.black38.withOpacity(.1),
                        ]
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(widget.curAlbum.title,
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 24, fontFamily: "Baloo2"),),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 410),
                child: Container(
                  margin: EdgeInsets.only(top: 4),
                  width: double.infinity,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 10),
                          child: Container(
                            child: Text(widget.curAlbum.category, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: "Baloo2")),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5),
                                child: Text("Date :", style: TextStyle(fontSize: 16, color: Colors.black54, fontFamily: "Baloo2"),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5),
                                child: Container(
                                  child: Text(widget.curAlbum.date, style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold, fontFamily: "Baloo2"),),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                          child: Text(
                            widget.curAlbum.content, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16, fontFamily: "Baloo2"),
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: Colors.black54, blurRadius: 5),
                      ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
