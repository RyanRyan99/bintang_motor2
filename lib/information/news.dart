import 'dart:async';
import 'package:bintang_motor/information/news_backend/news_detail.dart';
import 'package:flutter/material.dart';
import 'news_backend/album.dart';
import 'news_backend/albumcell.dart';
import 'news_backend/service.dart';

class NewsPage extends StatefulWidget {
  NewsPage() : super();
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  StreamController<int> streamController = new StreamController<int>();
  gridview(AsyncSnapshot<List<Album>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        padding: EdgeInsets.only(top: 5),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data.map(
              (album) {
            return GestureDetector(
              child: GridTile(
                child: AlbumCell(context, album),
              ),
              onTap:(){
                goToDetailsPage(context, album);
              },
            );
          },
        ).toList(),
      ),
    );
  }
  goToDetailsPage(BuildContext context, Album album) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => NewsDetail(
          curAlbum: album,
        ),
      ),
    );
  }
  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }
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
            padding: EdgeInsets.only(top: 125.0),
            child: Container(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: FutureBuilder<List<Album>>(
                      future: Services.getPhotos(),
                      builder: (context, snapshot){
                        if(snapshot.hasError){
                          return Text('Error ${snapshot.error}');
                        }
                        if(snapshot.hasData){
                          streamController.sink.add(snapshot.data.length);
                          return gridview(snapshot);
                        }
                        return circularProgress();
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
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
            child: Text("News",
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
  }










