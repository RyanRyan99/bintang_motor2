import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class CheckBpkb extends StatefulWidget {
  @override
  _CheckBpkbState createState() => _CheckBpkbState();
}

class _CheckBpkbState extends State<CheckBpkb> {
  List<BPKB> _list = [];
  List<BPKB> _search = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response = await http.get("https://bintang-niagajaya.000webhostapp.com/api_bpkb.php");
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState(() {
        for(Map i in data){
          _list.add(BPKB.fromJson(i));
          loading = false;
        }
      });
    }
  }
  TextEditingController searchController = new TextEditingController();
  Searching(String text) async {
    _search.clear();
    if(text.isEmpty){
      setState(() {
        return;
      });
    }
    _list.forEach((f){
      if(f.no_polisi.contains(text))
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
    initPlatformState();
    fetchData();
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
          Padding(
            padding: const EdgeInsets.only(top: 130),
             child: Container(
              color: Colors.white,
              child: new Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Container(
                            child: Text("Masukan No.Polisi:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7 ,left: 90),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromRGBO(255, 179, 179, 0.4),
                            ),
                            height: 40,
                            margin: EdgeInsets.only(bottom: 50, left: 50, right: 50),
                            child: new TextFormField(
                              inputFormatters: [LengthLimitingTextInputFormatter(9)],
                              controller: searchController,
                              style: TextStyle(height: 1.5, fontSize: 18),
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
                                if(searchController.text.length != 7 && searchController.text.length != 8 && searchController.text.length != 9){
                                  showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        title: Text("Terjadi Kesalahan :", style: TextStyle(fontSize: 12),),
                                        content: Text("Silahkan Cek No Polisi Kembali", style: TextStyle(fontWeight: FontWeight.bold),),
                                      );
                                    }
                                  );
                                }
                                else{
                                  Searching(searchController.text);
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
                                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0, color: Colors.black54)]
                            ),
                            child: Column(
                              children: <Widget>[
                                _HeaderCard(),
                                _IsiCard(),
                              ],
                            ),
                          ),
                        ),
                        _TextField(),
                        Padding(
                          padding: const EdgeInsets.only(top: 470, left: 10, right: 10),
                          child: Container(
                            child: _search.length == 0 || searchController.text.isNotEmpty ? ListView.builder(
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
                                    FlutterOpenWhatsapp.sendSingleMessage(b.no_telp,"Hallo Customer Bintang Motor");
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
            child: Text("Cek BPKB",
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
          padding: const EdgeInsets.all(8.0),
          child: new Text("Data Pemilik Kendaraan",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: new SizedBox(
            child: Container(
              height: 1.5,
              color: Colors.black,
            ),
          ),
        ),
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
          child: new Text("Pemilik Kendaraan",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Type Motor",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("No.Polisi",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("No.Mesin",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("No.Rangka",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Status BPKB",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(color: Colors.transparent,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Tgl Terbit BPKB",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(color: Colors.transparent,),
      ],
    );
  }
  Widget _TextField(){
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 118, left: 140, right: 20),
          child: Container(
            height: 40,
            width: double.infinity,
            child: Container(
              child: _search.length == 0 || searchController.text.isNotEmpty ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _search.length,
                itemBuilder: (context, i){
                  final b = _search[i];
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, left: 5),
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
                  new BoxShadow(blurRadius: 2.0, spreadRadius: 0.5, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 165, left: 140, right: 20),
          child: Container(
            height: 40,
            width: double.infinity,
            child: Container(
              child: _search.length == 0 || searchController.text.isNotEmpty ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _search.length,
                itemBuilder: (context, i){
                  final b = _search[i];
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, left: 5),
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
                  new BoxShadow(blurRadius: 2.0, spreadRadius: 0.5, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 213, left: 140, right: 20),
          child: Container(
            height: 40,
            width: double.infinity,
            child: Container(
                child: _search.length == 0 || searchController.text.isNotEmpty ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _search.length,
                  itemBuilder: (context, i){
                    final b = _search[i];
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, left: 5),
                        child: Text(b.no_polisi),
                      ),
                    );
                  },
                ) : ListView.builder()
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(blurRadius: 2.0, spreadRadius: 0.5, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 261, left: 140, right: 20),
          child: Container(
            height: 40,
            width: double.infinity,
            child: Container(
                child: _search.length == 0 || searchController.text.isNotEmpty ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _search.length,
                  itemBuilder: (context, i){
                    final b = _search[i];
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, left: 5),
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
                  new BoxShadow(blurRadius: 2.0, spreadRadius: 0.5, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 310, left: 140, right: 20),
          child: Container(
            height: 40,
            width: double.infinity,
            child: Container(
                child: _search.length == 0 || searchController.text.isNotEmpty ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _search.length,
                  itemBuilder: (context, i){
                    final b = _search[i];
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, left: 5),
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
                  new BoxShadow(blurRadius: 2.0, spreadRadius: 0.5, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 358, left: 140, right: 20),
          child: Container(
            height: 40,
            width: double.infinity,
            child: Container(
                child: _search.length == 0 || searchController.text.isNotEmpty ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _search.length,
                  itemBuilder: (context, i){
                    final b = _search[i];
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, left: 5),
                        child: Text(b.status_bpkb),
                      ),
                    );
                  },
                ) : ListView.builder()
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(blurRadius: 2.0, spreadRadius: 0.5, color: Colors.black38)
                ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 405, left: 140, right: 20),
          child: Container(
            height: 40,
            width: double.infinity,
            child: Container(
                child: _search.length == 0 || searchController.text.isNotEmpty ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _search.length,
                  itemBuilder: (BuildContext context, int i){
                    DateTime b = _search[i].tanggal_terbit_bpkb;
                    DateFormat formatdata = new DateFormat('dd MMM yyyy');
                    String formated = formatdata.format(b);
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, left: 5),
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
                  new BoxShadow(blurRadius: 2.0, spreadRadius: 0.5, color: Colors.black38)
                ]
            ),
          ),
        ),
      ],
    );
  }
}

class BPKB {
  String id;
  String pemilik_kendaraan;
  String type_motor;
  String no_polisi;
  String no_mesin	;
  String no_rangka;
  String status_bpkb;
  DateTime tanggal_terbit_bpkb;
  String no_telp;

  BPKB({this.id, this.pemilik_kendaraan, this.type_motor, this.no_polisi,
      this.no_mesin, this.no_rangka, this.status_bpkb,
      this.tanggal_terbit_bpkb, this.no_telp});

  factory BPKB.fromJson(Map<String, dynamic> json){
    return BPKB(
      id: json['id'],
      pemilik_kendaraan: json['pemilik_kendaraan'],
      type_motor: json['type_motor'],
      no_polisi: json['no_polisi'],
      no_mesin: json['no_mesin'],
      no_rangka: json['no_rangka'],
      status_bpkb: json['status_bpkb'],
      tanggal_terbit_bpkb: json['tanggal_terbit_bpkb'] == null ? null : DateTime.parse(json['tanggal_terbit_bpkb']),
      no_telp: json['no_telp'],
    );
  }
}
