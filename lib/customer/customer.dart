import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bintang_motor/customer/service.dart';
import 'package:http/http.dart' as http;

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}
class _CustomerState extends State<Customer> {

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
  Widget _Tabs(){
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Menu(),
          body: TabBarView(
            children: [
              Container(
                child: Column(
                  children: <Widget>[
                    _NotifCard(),
                  ],
                )
              ),
              Container(
                child: Column(
                  children: <Widget>[

                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _NotifCard(){
    window.physicalSize;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double height1 = height - padding.top - padding.bottom;
    double height2 = height - padding.top;
    double height3 = height - padding.top - kToolbarHeight;
    return Flexible(
      child: Container(
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
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                new Text("2020",style: TextStyle(color: Colors.white,fontSize: 11, fontWeight: FontWeight.bold),),
                                new Text("15",style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),),
                                new Text("FEB",style: TextStyle(color: Colors.white,fontSize: 11, fontWeight: FontWeight.bold),),
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
                                    new Text("", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                    new Text("Honda BeAT Sporty",style: TextStyle(color: Colors.black38,fontSize: 14, fontWeight: FontWeight.bold),),
                                    new Text("CASH",style: TextStyle(color: Colors.red,fontSize: 14, fontWeight: FontWeight.bold),)
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
                          onPressed: (){},
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
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

class Customer2 extends StatefulWidget {
  @override
  _Customer2State createState() => _Customer2State();
}

class _Customer2State extends State<Customer2> {
  List<CardCustomer> _list = [];
  List<CardCustomer> _search = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response = await http.get("https://bintang-niagajaya.000webhostapp.com/api_customer_deal.php");
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data){
          _list.add(CardCustomer.fromJson(i));
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
      if(f.nama.contains(text))
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
              padding: EdgeInsets.only(top: 50),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 300,
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.search),
                        title: TextField(
                          controller: controller,
//                          onChanged: Searching,
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
                  FlatButton(
                    child: Icon(Icons.search, color: Colors.white,),
                    // ignore: unnecessary_statements
                    onPressed: (){
                      setState(() {
                        Searching(controller.text);
                      });
                    },
                    color: Colors.red,
                  )
                ],
              ),
            ),
            loading ? Center(
              child: CircularProgressIndicator(),
            ) : Flexible(
                child: _search.length != 0 || controller.text.isNotEmpty ? ListView.builder(
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
                                  b.nama
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
                                b.produk_pembelian,
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
                                  b.pembayaran
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
                                  b.tanggal
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
                                  b.id
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
                          Container(
                            height: 40,
                            width: double.infinity,
                            margin: EdgeInsets.all(5),
                            child: Container(
                              child: Text(
                                  a.nama
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
                )
            )
          ],
        ),
      ),
    );
  }
}
