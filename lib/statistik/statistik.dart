import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Statistik extends StatefulWidget {
  @override
  _StatistikState createState() => _StatistikState();
}
class _StatistikState extends State<Statistik> {
  Future<DataService> getData() async {
    final response = await http.get("https://bintang-niagajaya.000webhostapp.com/api_statistik.php");
    if(response.statusCode == 200){
      return DataService.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Error');
    }
  }
  int touchedIndex;

  @override
  void setState(fn) {
    getData();
    print(getData());
    // TODO: implement setState
    super.setState(fn);
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
                    child: Text("Statistik",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                      height: 500,
                      child: _Chart()
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _Chart(){
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        color: Colors.white,
        height: 500,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback: (pieTouchResponse){
                        setState(() {
                          if (pieTouchResponse.touchInput is FlLongPressEnd || pieTouchResponse.touchInput is FlPanEnd){
                            touchedIndex = -1;
                          }else{
                            touchedIndex = pieTouchResponse.touchedSectionIndex;
                          }
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 50,
                      sections: showingSections()),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Colors.red,
                  text: "Data Open",
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.orangeAccent,
                  text: "Deal",
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Colors.blueGrey,
                  text: 'No Deal',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
            const SizedBox(
              width: 18,
            )
          ],
        ),
      ),
    );
  }
  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.red,
            value: 60,
            title: '60%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orangeAccent,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.blueGrey,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
class DataService {
  String data_open;
  String deal;
  String no_deal;

  DataService({this.data_open, this.deal, this.no_deal});

  factory DataService.fromJson(Map<String, dynamic> json){
    return DataService(
      data_open: json['DataOpen'],
      deal: json['Deal'],
      no_deal: json['NoDeal'],
    );
  }

}
class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}