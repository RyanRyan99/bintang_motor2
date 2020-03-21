import 'dart:convert';
import 'package:bintang_motor/customer/customer.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Notifikasi extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  bool loading = false;
  List<CardNotifikasi> _list = List<CardNotifikasi>();
  Future<List<CardNotifikasi>> getData() async {
    var url = "https://bintang-niagajaya.000webhostapp.com/api_notifikasi.php";
    var response = await http.get(url);
    var list = List<CardNotifikasi>();
    if(response.statusCode == 200){
      var listjson = json.decode(response.body);
      for(var datajson in listjson){
        list.add(CardNotifikasi.fromJson(datajson));
        loading = false;
      }
    }
    return list;
  }
  @override
  void initState() {
    getData().then((value){
      if (!mounted) return;
        setState(() {
          _list.addAll(value);
        });
        super.initState();
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
      child: loading ? Center(
          child: CircularProgressIndicator()
         ) : ListView.builder(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _list.length,
        shrinkWrap: true,
        itemBuilder: (context, i){
          final a = _list[i];
          DateTime time = _list[i].date;
          DateFormat formated = new DateFormat("MMM");
          String formater = formated.format(time);
          DateTime timers = _list[i].tanggal;
          DateFormat formated2 = new DateFormat("MMM");
          String formater2 = formated2.format(timers);
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
                              child: Text("Access",style: TextStyle(color: Colors.white, fontSize: 11),),
                              onPressed: (){
                                  if(a.nama == a.nama){
                                    (nama){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> new Customer(dataopen: nama,)));
                                    };
                                  }
                              },
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
                                    new Text(timers.year.toString(),style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),),
                                    new Text(timers.day.toString(),style: TextStyle(color: Colors.white,fontSize: 28, fontWeight: FontWeight.bold),),
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
                                        new Text(a.title, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                        new Text(a.content, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black38,fontSize: 14, fontWeight: FontWeight.bold),),
                                        new Text(a.category,style: TextStyle(color: Colors.red,fontSize: 14, fontWeight: FontWeight.bold),)
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
    );
  }
}
class CardNotifikasi {
  String title;
  String category;
  DateTime date;
  String content;
  String nama;
  String produk_pembelian;
  String pembayaran;
  DateTime tanggal;
  String data;

  CardNotifikasi({this.title, this.category, this.date, this.content, this.nama,
      this.produk_pembelian, this.pembayaran, this.tanggal, this.data});

  factory CardNotifikasi.fromJson(Map<String, dynamic> json){
    return CardNotifikasi(
      title: json['title'],
      category: json['category'],
      date: json['date'] == null ? null : DateTime.parse(json['date']),
      content: json['content'],
      nama: json['nama'],
      produk_pembelian: json['produk_pembelian'],
      pembayaran: json['pembayaran'],
      tanggal: json['tanggal'] == null ? null : DateTime.parse(json['tanggal']),
      data: json['data'],
    );
  }
}





















