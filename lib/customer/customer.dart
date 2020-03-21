import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bintang_motor/customer/service.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Customer extends StatefulWidget {
  final CardCustomer dataopen;
  Customer({this.dataopen});
  @override
  _CustomerState createState() => _CustomerState();
}
class _CustomerState extends State<Customer>  {
  List<CardCustomer> _list = List<CardCustomer>();
  Future<List<CardCustomer>> getData() async {
    var url = "https://bintang-niagajaya.000webhostapp.com/api_customer_dataopen.php";
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
  List<CardCustomer> _list2 = List<CardCustomer>();
  Future<List<CardCustomer>> getDataDeal() async {
    var url = "https://bintang-niagajaya.000webhostapp.com/api_customer_deal.php";
    var response = await http.get(url);
    var list = List<CardCustomer>();
    if(response.statusCode == 200){
      var listjson2 = json.decode(response.body);
      for(var datajson2 in listjson2){
        list.add(CardCustomer.fromJson(datajson2));
      }
    }
    return list;
  }
  List<CardCustomer> _list3 = List<CardCustomer>();
  Future<List<CardCustomer>> getDataNoDeal() async {
    var url = "https://bintang-niagajaya.000webhostapp.com/api_customer_nodeal.php";
    var response = await http.get(url);
    var list = List<CardCustomer>();
    if(response.statusCode == 200){
      var listjson3 = json.decode(response.body);
      for(var listjson3 in listjson3){
        list.add(CardCustomer.fromJson(listjson3));
      }
    }
    return list;
  }
  String _platformVersion = 'Unknown';
  Future<void> initPlatformState()  async{
    String platformVersion;
    try{
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    }on PlatformException{
      platformVersion = "Gagal mendapatkan versi";
    }
    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
  }
  @override
  void initState() {
    getData().then((value){
      setState(() {
        _list.addAll(value);
      });
    });
    getDataDeal().then((value){
      setState(() {
        _list2.addAll(value);
      });
    });
    getDataNoDeal().then((value){
      setState(() {
        _list3.addAll(value);
      });
    });
    super.initState();
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
                    child: Text("Data Customer",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130.0),
             child: Container(
               width: double.infinity,
               height: 60,
              color: Colors.white30,
              child: new Stack(
                children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(right: 115, bottom: 10),
                      child: Align(
                       alignment: Alignment.centerRight,
                       child: Container(
                        width: 90,
                        height: 30,
                        child: RaisedButton(
                          splashColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          color: Colors.red,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.filter_list),
                              Text("Filter", style: TextStyle(color: Colors.white),)
                            ],
                          ),
                          onPressed: (){},
                        ),
                        ),
                     ),
                   ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 8),
                     child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                       width: 100,
                       height: 30,
                       child: RaisedButton(
                         splashColor: Colors.white,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20)
                         ),
                         color: Colors.red,
                         child: Row(
                           children: <Widget>[
                             Icon(Icons.sort,),
                             Text("Urutan", style: TextStyle(color: Colors.white),)
                           ],
                         ),
                         onPressed: (){},
                       ),
                        ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
              ),
              child: Stack(
                children: <Widget>[
                  _Tabs()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _Tabs() {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Menu(),
          body: TabBarView(
            children: [
              Container(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      _NotifCardDataOpen(),
                    ],
                  ),
                )
              ),
              Container(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      _NotifCardDeal()
                    ],
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      _NotifCardNoDeal()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _NotifCardDataOpen(){
    widget.dataopen;
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
              return Container(
                child: Card(
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
                              child: Text("Follow Up",style: TextStyle(color: Colors.white, fontSize: 11),),
                              onPressed: (){
                                showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        title: Align(
                                          alignment: Alignment.center,
                                            child: Text("Hubungi Via")
                                        ),
                                        content: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8, left: 20, bottom: 8),
                                              child: InkWell(
                                                  onTap: (){
                                                    FlutterOpenWhatsapp.sendSingleMessage(a.no_telp,"Hallo Customer Bintang Motor");
                                                    return Text('Running on: $_platformVersion\n');
                                                  },
                                                  child: Icon(FontAwesomeIcons.whatsappSquare, size: 50, color: Colors.red,)
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8, right: 20, bottom: 8),
                                              child: InkWell(
                                                onTap:() => launch("tel://${a.no_telp}"),
                                                  child: Icon(FontAwesomeIcons.phoneSquare, size: 50, color: Colors.red,)
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
  Widget _NotifCardDeal(){
    window.physicalSize;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: _list2.length,
            shrinkWrap: true,
            itemBuilder: (context, i){
              final a = _list2[i];
              DateTime time = _list2[i].tanggal;
              DateFormat formated = new DateFormat("MMM");
              String formater = formated.format(time);
              return Container(
                child: Card(
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
                              child: Text("Follow Up",style: TextStyle(color: Colors.white, fontSize: 11),),
                              onPressed: (){
                                showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        title: Align(
                                            alignment: Alignment.center,
                                            child: Text("Hubungi Via")
                                        ),
                                        content: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8, left: 20, bottom: 8),
                                              child: InkWell(
                                                  onTap: (){
                                                    FlutterOpenWhatsapp.sendSingleMessage(a.no_telp,"Hallo Customer Bintang Motor");
                                                    return Text('Running on: $_platformVersion\n');
                                                  },
                                                  child: Icon(FontAwesomeIcons.whatsappSquare, size: 50, color: Colors.red,)
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8, right: 20, bottom: 8),
                                              child: InkWell(
                                                  onTap:() => launch("tel://${a.no_telp}"),
                                                  child: Icon(FontAwesomeIcons.phoneSquare, size: 50, color: Colors.red,)
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
  Widget _NotifCardNoDeal(){
    window.physicalSize;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: _list3.length,
            shrinkWrap: true,
            itemBuilder: (context, i){
              final a = _list3[i];
              DateTime time = _list3[i].tanggal;
              DateFormat formated = new DateFormat("MMM");
              String formater = formated.format(time);
              return Container(
                child: Card(
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
                              child: Text("Follow Up",style: TextStyle(color: Colors.white, fontSize: 11),),
                              onPressed: (){
                                showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        title: Align(
                                            alignment: Alignment.center,
                                            child: Text("Hubungi Via")
                                        ),
                                        content: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8, left: 20, bottom: 8),
                                              child: InkWell(
                                                  onTap: (){
                                                    FlutterOpenWhatsapp.sendSingleMessage(a.no_telp,"Hallo Customer Bintang Motor");
                                                    return Text('Running on: $_platformVersion\n');
                                                  },
                                                  child: Icon(FontAwesomeIcons.whatsappSquare, size: 50, color: Colors.red,),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8, right: 20, bottom: 8),
                                              child: InkWell(
                                                  onTap:() => launch("tel://${a.no_telp}"),
                                                  child: Icon(FontAwesomeIcons.phoneSquare, size: 50, color: Colors.red,)
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
  Widget Menu(){
    return Container(
      child: TabBar(
        labelColor: Colors.red,
        indicatorColor: Colors.red,
        tabs: <Widget>[
          Tab(text: "Deal Open",),
          Tab(text: "Deal",),
          Tab(text: "No Deal",),
        ],
      ),
    );
  }
}

