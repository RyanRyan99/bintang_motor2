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
              color: Colors.black12,
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
                            Icon(Icons.sync),
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
                            Icon(Icons.dehaze),
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
              Container(child: Text("Data Open")),
              Container(child: Text("Deal")),
              Container(child: Text("No Deal")),
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
