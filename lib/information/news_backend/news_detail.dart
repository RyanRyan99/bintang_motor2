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
      body: new Stack(
        children: <Widget>[
          new Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.curAlbum.images),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black54.withOpacity(.8),
                    Colors.black12.withOpacity(.1),
                  ]
                )
              ),
              child: Container(
                padding: EdgeInsets.only(right: 10, left: 10, bottom: 80),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(widget.curAlbum.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 280),
            child: Container(
              margin: EdgeInsets.all(10),
              height: 600,
              width: double.infinity,
              child: new Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    right: 25,
                    top: 10,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.bookmark, color: Colors.black54,),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(widget.curAlbum.category),
                          ),
                          Container(
                            child: Icon(Icons.date_range, color: Colors.black54,),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(widget.curAlbum.date),
                          ),
                          InkWell(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Icon(Icons.share, color: Colors.black54,),
                                ),
                                SizedBox(
                                  width: 70,
                                  child: Text("Share Post"),
                                )
                              ],
                            ),
                            onTap: (){print("C");},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 55, left: 8, right: 8),
                    child: Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SingleChildScrollView(
                          child: Container(
                            child: Text(widget.curAlbum.content, textAlign: TextAlign.justify),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  new BoxShadow(blurRadius: 8.0)
                ]
              ),
            ),
          ),
          SizedBox(
            child: Center(
              child: Container(
                height: 1,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
