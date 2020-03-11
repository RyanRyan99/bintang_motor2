import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<STNK> _list = [];
  List<STNK> _search = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response = await http.get("https://bintang-niagajaya.000webhostapp.com/api_stnk.php");
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data){
          _list.add(STNK.fromJson(i));
          loading = false;
        }
      });
    }
  }
  TextEditingController controller = new TextEditingController();

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
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    onChanged: Searching,
                    decoration: InputDecoration(
                      hintText: "Search", border: InputBorder.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: (){
                      controller.clear();
                      Searching('');
                    },
                  ),
                ),
              ),
            ),
            loading ? Center(
              child: CircularProgressIndicator(),
            ) : Expanded(
              child: _search.length == 0 || controller.text.isNotEmpty ? ListView.builder(
                itemCount: _search.length,
                itemBuilder: (context, i) {
                  final b = _search[i];
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: double.infinity,
                          margin: EdgeInsets.all(5),
                          child: Container(
                            child: Text(
                                b.no_mesin
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                              ]
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          margin: EdgeInsets.all(5),
                          child: Container(
                            child: Text(
                                b.pemilik_kendaraan,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                              ]
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          margin: EdgeInsets.all(5),
                          child: Container(
                            child: Text(
                                b.type_motor
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                              ]
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          margin: EdgeInsets.all(5),
                          child: Container(
                            child: Text(
                                b.no_rangka
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                              ]
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          margin: EdgeInsets.all(5),
                          child: Container(
                            child: Text(
                                b.status_stnk
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                              ]
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          margin: EdgeInsets.all(5),
                          child: Container(
                            child: Text(
                                b.tanggal_terbit_stnk
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(spreadRadius: 0.5,blurRadius: 2.0, color: Colors.black38)
                              ]
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ) : ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, i){
                  final a = _list[i];
                  return Container(
                    child: Column(
                      children: <Widget>[

                      ],
                    ),
                  );
                },
              )
            )
          ],
        ),
      ),
    );
  }
}






class STNK{
  final String id;
  final String no_mesin;
  final String pemilik_kendaraan;
  final String type_motor;
  final String no_rangka;
  final String status_stnk;
  final String tanggal_terbit_stnk;

  STNK({this.id, this.no_mesin, this.pemilik_kendaraan, this.type_motor,
    this.no_rangka, this.status_stnk, this.tanggal_terbit_stnk});

  factory STNK.fromJson(Map<String, dynamic> json){
    return new STNK(
      id: json['id'],
      no_mesin: json['no_mesin'],
      pemilik_kendaraan: json['pemilik_kendaraan'],
      type_motor: json['type_motor'],
      no_rangka: json['no_rangka'],
      status_stnk: json['status_stnk'],
      tanggal_terbit_stnk: json['tanggal_terbit_stnk'],
    );
  }
}