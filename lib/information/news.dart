import 'package:bintang_motor/information/news_detail.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
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
              child: new Stack(
                children: <Widget>[
                  Container(
                    color: Colors.white70,
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(15),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        _CardNews(image: 'assets/berita.jpg'),
                        _CardNews(image: 'assets/Sample.jpg'),
                        _CardNews(image: 'assets/berita2.jpg'),
                        _CardNews(image: 'assets/berita.jpg'),
                        _CardNews(image: 'assets/Sample2.jpg'),
                        _CardNews(image: 'assets/berita2.jpg'),
                        _CardNews(image: 'assets/berita2.jpg'),
                        _CardNews(image: 'assets/berita.jpg'),
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
            child: Text("Berita Terbaru",
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
  Widget _CardNews({image}){
    return Container(
      child: InkWell(
        splashColor: Colors.white,
        hoverColor: Colors.white,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => new NewsDetail()));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(blurRadius: 8,spreadRadius: 0.5, color: Colors.black38)
              ]
            ),
          ),
        ),
      ),
    );
  }
}

