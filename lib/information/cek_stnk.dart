import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class CheckStnk extends StatefulWidget {
  @override
  _CheckStnkState createState() => _CheckStnkState();
}
class _CheckStnkState extends State<CheckStnk> {
  List<STNK> _list = [];
  List<STNK> _search = [];
  var loading = false;
  Future<Null> fetchData() async{
    setState(() {
      loading = true;
    });
    _list.clear();
    final response = await http.get("https://bintang-niagajaya.000webhostapp.com/api_stnk.php");
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState(() {
        for(Map i in data){
          _list.add(STNK.fromJson(i));
          loading = false;
        }
      });
    }
  }
  TextEditingController searchcontroller = new TextEditingController();
  Searching(String text) async{
    _search.clear();
    if(text.isEmpty){
      setState(() {
        return;
      });
    }
    _list.forEach((f){
      if(f.no_mesin.contains(text))
        _search.add(f);
    });
    setState(() {});
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
    fetchData();
    initPlatformState();
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
                _Logo()
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 130),
               child: Container(
                color: Colors.white,
                child: new Stack(
                  children: <Widget>[
                    new Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Container(
                            child: Text("Masukan No.Mesin:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7, left: 90),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromRGBO(255, 179, 179, 0.4),
                            ),
                            height: 40,
                            margin: EdgeInsets.only(left: 50, right: 50, bottom: 50),
                            child: TextFormField(
                              inputFormatters: [LengthLimitingTextInputFormatter(12)],
                              controller: searchcontroller,
                              style: TextStyle(height: 2.0),
                              cursorColor: Colors.red,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),

                            ),
                          ),
                        ),
                        Align(
                         alignment: Alignment.centerRight,
                         child: Container(
                           padding: EdgeInsets.only(right: 8),
                           height: 50,
                            child: InkWell(
                             onTap: (){
                               if(searchcontroller.text.length != 12){
                                 showDialog(
                                   context: context,
                                   builder: (context){
                                    return AlertDialog(
                                      title: Text("Terjadi Kesalahan :", style: TextStyle(fontSize: 12),),
                                      content: Text("No Mesin Harus 12 Digit"),
                                    );
                                   }
                                 );
                               }
                               else {
                                 Searching(searchcontroller.text);
                               }
                             },
                             child: Card(
                               color: Colors.red,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: <Widget>[
                                   Icon(Icons.search, size: 35, color: Colors.white,)
                                 ],
                               ),
                             ),
                           ),
                         ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
                            child: Container(
                              height: 400.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0,color: Colors.black54)]
                              ),
                              child: Column(
                              children: <Widget>[
                                _HeaderCard(),
                                _IsiCard(),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 470, left: 10, right: 10),
                          child: Container(
                            child: _search.length == 0 || searchcontroller.text.isNotEmpty ? ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: _search.length,
                              itemBuilder: (context, i){
                                final b = _search[i];
                                return RaisedButton(
                                  splashColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  color: Colors.red,
                                  onPressed: (){
                                    FlutterOpenWhatsapp.sendSingleMessage(b.no_telpon,"Hallo Customer Bintang Motor");
                                    return Text('Running on: $_platformVersion\n');
                                  },
                                  child: Text("Hubungi Konsumen",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ) : ListView.builder(),
                          ),
                        ),
                        _TextField()
                      ],
                    ),
                  ],
                ),
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
            child: Text("Cek STNK",
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
  Widget _HeaderCard(){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: new Text("Data Pemilik Kendaraan",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: SizedBox(
            height: 1.5,
            width: double.infinity,
            child: new Center(
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget _IsiCard(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Pemilik Kendaraan",
          style: TextStyle(
              color:  Colors.red,
              fontWeight: FontWeight.bold
          ),
          ),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Type Motor",
            style: TextStyle(
                color:  Colors.red,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("No.Mesin",
            style: TextStyle(
                color:  Colors.red,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("No.Rangka",
            style: TextStyle(
                color:  Colors.red,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Status STNK",
            style: TextStyle(
                color:  Colors.red,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Tgl Terbit STNK",
            style: TextStyle(
                color:  Colors.red,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("No Telpon",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold
           ),
          ),
        ),
      ],
    );
  }
  _TextField(){
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 110, left: 135, right: 15),
          child: Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.all(5),
            child: Container(
                child: _search.length == 0 || searchcontroller.text.isNotEmpty ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _search.length,
                  itemBuilder: (context, i){
                    final b = _search[i];
                    return Padding(
                      padding: const EdgeInsets.only(top: 12, left: 5),
                      child: Container(
                        child: Text(b.pemilik_kendaraan),
                      ),
                    );
                  },
                ) : ListView.builder()
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 158, left: 135, right: 15),
          child: Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.all(5),
            child: Container(
                child: _search.length == 0 || searchcontroller.text.isNotEmpty ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _search.length,
                  itemBuilder: (context, i){
                    final b = _search[i];
                    return Padding(
                      padding: const EdgeInsets.only(top: 12, left: 5),
                      child: Container(
                        child: Text(b.type_motor),
                      ),
                    );
                  },
                ) : ListView.builder()
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 206, left: 135, right: 15),
          child: Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.all(5),
            child: Container(
                child: _search.length == 0 || searchcontroller.text.isNotEmpty ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _search.length,
                  itemBuilder: (context, i){
                    final b = _search[i];
                    return Padding(
                      padding: const EdgeInsets.only(top: 12, left: 5),
                      child: Container(
                        child: Text(b.no_mesin),
                      ),
                    );
                  },
                ) : ListView.builder()
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 254, left: 135, right: 15),
          child: Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.all(5),
            child: Container(
                child: _search.length == 0 || searchcontroller.text.isNotEmpty ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _search.length,
                  itemBuilder: (context, i){
                    final b = _search[i];
                    return Padding(
                      padding: const EdgeInsets.only(top: 12, left: 5),
                      child: Container(
                        child: Text(b.no_rangka),
                      ),
                    );
                  },
                ) : ListView.builder()
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 302, left: 135, right: 15),
          child: Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.all(5),
            child: Container(
                child: _search.length == 0 || searchcontroller.text.isNotEmpty ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _search.length,
                  itemBuilder: (context, i){
                    final b = _search[i];
                    return Padding(
                      padding: const EdgeInsets.only(top: 12, left: 5),
                      child: Container(
                        child: Text(b.status_stnk),
                      ),
                    );
                  },
                ) : ListView.builder()
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350, left: 135, right: 15),
          child: Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.all(5),
            child: Container(
                child: _search.length == 0 || searchcontroller.text.isNotEmpty ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _search.length,
                  itemBuilder: (BuildContext context, int i){
                    DateTime b = _search[i].tanggal_terbit_stnk;
                    DateFormat formatdata = new DateFormat('dd MMM yyyy');
                    String formated = formatdata.format(b);
                    return Padding(
                      padding: const EdgeInsets.only(top: 12, left: 5),
                      child: Container(
                        child: Text(formated),
                      ),
                    );
                  },
                ) : ListView.builder()
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 398,left: 135, right: 15),
          child: Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.all(5),
            child: Container(
              child: _search.length == 0 || searchcontroller.text.isNotEmpty ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _search.length,
                itemBuilder: (context, i){
                  final b = _search[i];
                  return Padding(
                    padding: const EdgeInsets.only(top: 12, left: 5),
                    child: Container(
                      child: Text(b.no_telpon),
                    ),
                  );
                },
              ) : ListView.builder()
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(spreadRadius: 0.5, blurRadius: 2.0, color: Colors.black38)
              ]
            ),
          ),
        )
      ],
    );
  }
}
class STNK {
  String id;
  String no_mesin;
  String pemilik_kendaraan;
  String type_motor;
  String no_rangka;
  String status_stnk;
  DateTime tanggal_terbit_stnk;
  String no_telpon;

  STNK({this.id, this.no_mesin, this.pemilik_kendaraan, this.type_motor,
      this.no_rangka, this.status_stnk, this.tanggal_terbit_stnk, this.no_telpon});

  factory STNK.fromJson(Map<String, dynamic> json){
    return STNK(
      id: json['id'],
      no_mesin: json['no_mesin'],
      pemilik_kendaraan: json['pemilik_kendaraan'],
      type_motor: json['type_motor'],
      no_rangka: json['no_rangka'],
      status_stnk: json['status_stnk'],
      tanggal_terbit_stnk: json['tanggal_terbit_stnk'] == null ? null : DateTime.parse(json['tanggal_terbit_stnk']),
      no_telpon: json['no_telp'],
    );
  }
}
