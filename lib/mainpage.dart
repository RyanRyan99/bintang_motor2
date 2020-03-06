import 'dart:async';
import 'dart:ui';
import 'package:bintang_motor/customer/customer.dart';
import 'package:bintang_motor/information/cek_bpkb.dart';
import 'package:bintang_motor/information/cek_stnk.dart';
import 'package:bintang_motor/information/daftar_produk.dart';
import 'package:bintang_motor/information/news.dart';
import 'package:bintang_motor/mainpage_backend/albumcellmp.dart';
import 'package:bintang_motor/mainpage_backend/getdata-mp.dart';
import 'package:bintang_motor/mainpage_backend/info_detail.dart';
import 'package:bintang_motor/mainpage_backend/service.dart';
import 'package:bintang_motor/navigator_menu.dart';
import 'package:bintang_motor/pricelist/pricelist.dart';
import 'package:bintang_motor/statistik/statistik.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

void main(){
  runApp(new MaterialApp(
    home: new NavigatorPage(),
  ));
}
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  //PDF FILE
  String assetPDFPath = "";
  String urlPDFPath = "";
  @override
  void initState(){
    super.initState();
    //getfileassets
    getFileFromAsset("assets/SamplePDF.pdf").then((f){
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });
    getFileFromURL("https://bintangmotor.com/pricelist/cabang/Bintang-Motor-Bogor-Februari-2020.pdf").then((f){
      setState(() {
        urlPDFPath = f.path;
        print(urlPDFPath);
      });
    });
  }
  Future<File> getFileFromAsset(String asset) async{
    try{
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/SamplePDF.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    }catch (e){
      throw Exception("Error Saat Membuka File");
    }
  }
  Future<File> getFileFromURL(String url) async{
    try{
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/sample.pdf");
      File assetUrl = await file.writeAsBytes(bytes);
      return assetUrl;
    }catch (e){
      throw Exception("Error Load");
    }
  }
  //PDF FILE
  //
  StreamController<int> streamController = new StreamController<int>();
  gridview(AsyncSnapshot<List<AlbumMp>> snapshot) {
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
                child: AlbumCellMp(context, album),
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
  goToDetailsPage(BuildContext context, AlbumMp album) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => InfoPromoDetail(
          curAlbum: album,
        ),
      ),
    );
  }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
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
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
              color: Colors.red
            ),
            child: new Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Logo.png")
                      )
                    ),
                  ),
                ),
               Align(
                 alignment: Alignment.topRight,
                 child: Container(
                 padding: EdgeInsets.only(top: 40, right: 40),
                   child: Icon(Icons.notifications, color: Colors.white,),
                 ),
               ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 20),
                  child: Container(
                    width: 60.0,height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90, left: 90),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Hai, Selamat Datang",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                          ),
                        ),
                        new Text("Bruce Wayne",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Sales Point :",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 90),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("120.000",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            margin: EdgeInsets.only(top: 190.0, left: 20, right: 20),
            child: Row(
              children: <Widget>[
                _BoxLogo()
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(blurRadius: 10.0, color: Colors.black12)
                ]
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 270.0, left: MediaQuery.of(context).size.width/20),
            child: Container(
              child: Row(
                children: <Widget>[
                  _CardButton()
                ],
              ),
            ),
          ),
         Padding(
           padding: const EdgeInsets.only(top: 400),
           child: Container(
             color: Colors.white70,
             height: 200,
             child: new Stack(
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(top: 10),
                   child: Container(
                     child: Column(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(left: 10, bottom: 10),
                           child: Align(
                             alignment: Alignment.topLeft,
                               child: Text(
                                 "Info & Promo",
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold
                                 ),
                               )
                           ),
                         ),
                         Flexible(
                           child: FutureBuilder<List<AlbumMp>>(
                             future: ServiceMp.getPhotos(),
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

  //Untuk Container Logo
  Widget _BoxLogo(){
    ScreenScaler scaler = new ScreenScaler()..init(context);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    window.physicalSize;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
//    double height1 = height - padding.top - padding.bottom;
//    double height2 = height - padding.top;
//    double height3 = height - padding.top - kToolbarHeight;
    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(width: scaler.getWidth(8.0)),
          Container(
//              margin: EdgeInsets.only(left: queryData.size.width/8),
             child: Column(
              children: <Widget>[
                new IconButton(
                  icon: FaIcon(FontAwesomeIcons.database, size: 25, color: Colors.red,),
                  onPressed: (){
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Customer()
                    )
                    );
                  },
                ),
                new Text("Customer", style: TextStyle(fontSize: 11, color: Colors.red),)
              ],
            ),
          ),
          SizedBox(width: scaler.getWidth(15.0)),
          Container(
//            margin: EdgeInsets.only(left: queryData.size.width/8),
            child: Column(
              children: <Widget>[
                new IconButton(
                  icon: Icon(Icons.remove_red_eye,color: Colors.red, size: 30,),
                  onPressed: (){
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Statistik()
                    )
                    );
                  },
                ),
                new Text("Statistik", style: TextStyle(fontSize: 11, color: Colors.red),)
              ],
            ),
          ),
          SizedBox(width: scaler.getWidth(15.0)),
          Container(
//            margin: EdgeInsets.only(left: queryData.size.width/8),
            child: Column(
              children: <Widget>[
                new IconButton(
                  icon: Icon(Icons.attach_money, size: 30, color: Colors.red,),
                  onPressed: (){
                    if(urlPDFPath != null){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PriceList(path: urlPDFPath)));
                    }
                  },
                ),
                new Text("Price List", style: TextStyle(fontSize: 11,color: Colors.red),)
              ],
            ),
          ),
        ],
      ),
    );
  }
  //Untuk Card Button Icon
  Widget _CardButton(){
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              new InkWell(
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new CheckStnk()
                  )
                  );
                },
                child: Card(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width/25),
                    child: Column(
                      children: <Widget>[
                        new Icon(Icons.library_books, size: 50, color: Colors.white,),
                        new Text("STNK",style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              new InkWell(
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new CheckBpkb()
                  )
                  );
                },
                child: Card(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width/25),
                    child: Column(
                      children: <Widget>[
                        new Icon(Icons.collections_bookmark, size: 50, color: Colors.white,),
                        new Text("BPKB",style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              new InkWell(
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ListProduct()
                  )
                  );
                },
                child: Card(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width/25),
                    child: Column(
                      children: <Widget>[
                        new Icon(Icons.motorcycle, size: 50, color: Colors.white,),
                        new Text("PRODUK",style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              new InkWell(
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new NewsPage()
                  )
                  );
                },
                child: Card(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width/25),
                    child: Column(
                      children: <Widget>[
                        new Icon(Icons.list, size: 50, color: Colors.white,),
                        new Text("NEWS",style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  //Untuk Card Info Dan Promo
  Widget _CardInfo({image}){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 180, width: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(blurRadius: 3,spreadRadius: 1.0, color: Colors.black45)
                ]
            ),
          ),
        ],
      ),
    );
  }
}














