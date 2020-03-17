import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'customer/service.dart';

class Notifikasi extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  List<CardCustomer> _list = List<CardCustomer>();
  Future<List<CardCustomer>> getData() async {
    var url = "https://bintang-niagajaya.000webhostapp.com/api_customer.php";
    var response = await http.get(url);
    var list = List<CardCustomer>();
    if(response.statusCode == 200){
      var listjson = json.decode(response.body);
      for(var datajson in listjson){
        list.add(CardCustomer.fromJson(datajson));
      }
    }
    return list;
  }
  List<CardNewsNotif> _list2 = List<CardNewsNotif>();
  Future<List<CardNewsNotif>> getNews() async {
    var url = "https://bintang-niagajaya.000webhostapp.com/api_news.php";
    var response = await http.get(url);
    var list = List<CardNewsNotif>();
    if(response.statusCode == 200){
      var listjson = json.decode(response.body);
      for(var datajson in listjson){
        list.add(CardNewsNotif.fromJson(datajson));
      }
    }
    return list;
  }
  @override
  void initState() {
    getData().then((value){
      setState(() {
        _list.addAll(value);
      });
    });
    getNews().then((value){
      setState(() {
        _list2.addAll(value);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    window.physicalSize;
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
               child: SingleChildScrollView(
                 physics: ScrollPhysics(),
                 child: Column(
                   children: <Widget>[
                     _CardNotifilasi(),
                   ],
                 ),
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
    return Container(
      child: Column(
        children: <Widget>[
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: _list.length,
            shrinkWrap: true,
            itemBuilder: (context, i){
              final a = _list[i];
              DateTime time = _list[i].tanggal;
              DateFormat formated = new DateFormat("MMM");
              String formater = formated.format(time);

              final b = _list2[i];
              DateTime time2 = _list2[i].date;
              DateFormat formated2 = new DateFormat("MMM");
              String formater2 = formated2.format(time2);
              return Container(
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
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 50,
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      new Text(time.year.toString(),style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),),
                                      new Text(time.day.toString(),style: TextStyle(color: Colors.white,fontSize: 28, fontWeight: FontWeight.bold),),
                                      new Text(formater,style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),),
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
                                          new Text(a.nama, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                          new Text(a.produk_pembelian,style: TextStyle(color: Colors.black38,fontSize: 14, fontWeight: FontWeight.bold),),
                                          new Text(a.pembayaran,style: TextStyle(color: Colors.red,fontSize: 14, fontWeight: FontWeight.bold),)
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
                              width: 85,
                              child: RaisedButton(
                                splashColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
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
                     Card(
                      child: new Stack(
                        children: <Widget>[
                          Container(
                            width: width,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 50,
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        new Text(time2.year.toString(),style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),),
                                        new Text(time2.day.toString(),style: TextStyle(color: Colors.white,fontSize: 28, fontWeight: FontWeight.bold),),
                                        new Text(formater2,style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),),
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
                                            new Text(b.title, overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                            new Text(b.content, overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(color: Colors.black38,fontSize: 14, fontWeight: FontWeight.bold),),
                                            new Text(b.category,style: TextStyle(color: Colors.red,fontSize: 14, fontWeight: FontWeight.bold),)
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
                                width: 85,
                                child: RaisedButton(
                                  splashColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  color: Colors.red,
                                  child: Text("Open",style: TextStyle(color: Colors.white, fontSize: 11),),
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
              );
            },
          ),

        ],
      ),
    );
  }
}
class CardNewsNotif{
  String id;
  String title;
  String content;
  String category;
  DateTime date;

  CardNewsNotif({this.id, this.title, this.content, this.category, this.date});
  factory CardNewsNotif.fromJson(Map<String, dynamic> json){
    return CardNewsNotif(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      category: json['category'],
      date: json['date'] == null ? null : DateTime.parse(json['date']),
    );
  }

}