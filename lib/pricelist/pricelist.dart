import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../navigator_menu.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
void main(){
  runApp(new MaterialApp(
    home: new NavigatorPage(),
  ));
}
class PriceList extends StatefulWidget {
  //PDF
  final String path;
  const PriceList({Key key, this.path}) : super(key: key);
  //PDF
  @override
  _PriceListState createState() => _PriceListState();
}
class _PriceListState extends State<PriceList> {
  //PDF
  int _totalPages = 0;
  int _currentPage = 0;
  bool _pdfReady = false;
  PDFViewController _pdfViewController;
  //PDF
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
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
                    child: Text("Price List",
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
              height: 470,
              child: PDFView(
                filePath: widget.path,
                autoSpacing: true,
                enableSwipe: true,
                pageSnap: true,
                swipeHorizontal: true,
                nightMode: false,
                onError: (e){
                  print(e);
                },
                onRender: (_pages){
                  setState(() {
                    _totalPages = _pages;
                    _pdfReady = true;
                  });
                },
                onViewCreated: (PDFViewController vc){
                  _pdfViewController = vc;
                },
                onPageChanged: (int page,int total){
                  setState(() {});
                },
                onPageError: (page, e){},
              ),
            ),
          ),
          !_pdfReady ? Center(
            child: CircularProgressIndicator(),
          ): Offstage(),

          Padding(
            padding: const EdgeInsets.only(bottom: 22, left: 20),
             child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 30,
                width: 95,
                child: Container(
                  width: double.infinity,
                   child: RaisedButton(
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    color: Colors.red,
                      child: Row(
                        children: <Widget>[
                          new Text("Share", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          new Icon(Icons.share,color: Colors.white),
                        ],
                      ),
                      onPressed: (){
                        Share.share("https://bintangmotor.com/pricelist/cabang/Bintang-Motor-Bogor-Februari-2020.pdf");
                      }
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _currentPage > 0 ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              child: FloatingActionButton.extended(
                  splashColor: Colors.white,
                  backgroundColor: Colors.orange,
                  label: Text("Hal ${_currentPage - 1}"),
                  onPressed: (){
                    _currentPage -= 1;
                    _pdfViewController.setPage(_currentPage);
                  },
              ),
            ),
          ) : Offstage(),
          _currentPage + 1 < _totalPages ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              child: FloatingActionButton.extended(
                splashColor: Colors.white,
                backgroundColor: Colors.redAccent,
                label: Text("Hal ${_currentPage + 1}"),
                onPressed: (){
                  _currentPage += 1;
                  _pdfViewController.setPage(_currentPage);
                },
              ),
            ),
          ) : Offstage(),

        ],
      ),
    );
  }
}




