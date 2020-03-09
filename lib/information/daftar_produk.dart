import 'dart:async';
import 'package:bintang_motor/information/detail_produk.dart';
import 'package:bintang_motor/information/produk_backend/service.dart';
import 'package:bintang_motor/mainpage_backend/albumcellmp.dart';
import 'package:bintang_motor/mainpage_backend/getdata-mp.dart';
import 'package:bintang_motor/mainpage_backend/info_detail.dart';
import 'package:bintang_motor/mainpage_backend/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'produk_backend/albumcellpr.dart';
import 'produk_backend/getdata-prod.dart';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  //manual_API
  StreamController<int> streamController = new StreamController<int>();
  gridview(AsyncSnapshot<List<AlbumProd>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data.map(
              (album) {
            return GestureDetector(
              child: GridTile(
                child: AlbumCellPr(context, album),
              ),
              onTap: () {
                goToDetailsPage(context, album);
              },
            );
          },
        ).toList(),
      ),
    );
  }
  goToDetailsPage(BuildContext context, AlbumProd album) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => DetailProduk(
          curAlbum: album,
        ),
      ),
    );
  }
  //manual_API
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 130),
             child: RotatedBox(
              quarterTurns: 10,
              child: Container(
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
            padding: const EdgeInsets.only(top: 140),
            child: Container(
              color: Colors.white70,
              height: 140,
              child: new Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                             child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  "Manual",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: FutureBuilder<List<AlbumProd>>(
                              future: ServiceProd.getPhotos(),
                              builder: (context, snapshot){
                                if(snapshot.hasError){
                                  return Text("Error${snapshot.error}");
                                }
                                if(snapshot.hasData){
                                  streamController.sink.add(snapshot.data.length);
                                  return gridview(snapshot);
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                          )
                        ],
                      ),
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
              child: Text("Daftar Produk",
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
  Widget _PremiumCard({image}){
    return Container(
      child: Row(
        children: <Widget>[
           Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.red,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => new DetailProduk()
                  ));
                },
                child: Container(
                  height: 100, width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Container(
                height: 100, width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://bintangmotor.com/wp-content/uploads/2019/08/advance-black-metallic-bintangmotor-1.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _SportCard(){
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Container(
                height: 100, width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://bintangmotor.com/wp-content/uploads/2019/08/advance-black-metallic-bintangmotor-1.png"),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _MaticCard(){
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Container(
                height: 100, width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://bintangmotor.com/wp-content/uploads/2019/08/advance-black-metallic-bintangmotor-1.png"),
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _CubCard(){
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Container(
                height: 100, width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://bintangmotor.com/wp-content/uploads/listing-uploads/gallery/2019/12/pearl-shining-black-1024x343.png"),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}













