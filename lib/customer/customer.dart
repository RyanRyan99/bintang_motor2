import 'dart:ui';

import 'package:flutter/material.dart';

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
                    padding: const EdgeInsets.only(left: 150),
                     child: Container(
                      width: 90,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 250),
                     child: Container(
                      width: 100,
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
                    _NotifCard()
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    _NotifCard()
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    _NotifCard()
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
        child: SingleChildScrollView(
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
                                      new Text("Budi Setiawan",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
                          width: 70,
                          child: RaisedButton(
                            splashColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
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
              )
            ],
          ),
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
