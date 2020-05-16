import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieCharts extends StatefulWidget {
  @override
  _PieChartsState createState() => _PieChartsState();
}

class _PieChartsState extends State<PieCharts> {

  List<StatistikData> _statictik = List<StatistikData>();
  Future<List<StatistikData>> fatch() async {
    var url = 'http://36.67.190.179:15032/sales_point/api_statistik.php';
    var response = await http.get(url);
    var stats = List<StatistikData>();
    if(response.statusCode == 200){
      var statJson = json.decode(response.body);
      for(var statssJson in statJson){
        stats.add(StatistikData.fromJson(statssJson));
      }
    }
    return stats;
  }

  bool toggle = false;
  Map<String, double> dataMap = new Map();
  List<String> data = new List();
  List<Color> colorList = [
    Colors.red,
    Colors.grey[400],
    Colors.red[200],
  ];

  var deall;
 @override
  void initState() {
    super.initState();
    fatch().then((value){
      setState(() {
        _statictik.addAll(value);
//        print(_statictik[0].deal);
//        print(_statictik[0].noDeal);
//        print(_statictik[0].dataOpen);
      deall = _statictik[0].deal;
      });
    });
    dataMap.putIfAbsent("Deal", () => deall);
    dataMap.putIfAbsent("No Deal", () => deall);
    dataMap.putIfAbsent("Data Open", () => deall);
    setState(() {
      toggle = !toggle;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Container(
            child: Center(
              child: toggle
                  ? PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 1000),
                chartLegendSpacing: 32.0,
                chartRadius: MediaQuery.of(context).size.width / 1.7,
                showChartValuesInPercentage: true,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.transparent,
                colorList: colorList,
                showLegends: true,
                legendPosition: LegendPosition.bottom,
                legendStyle: TextStyle(fontSize: 18),
                decimalPlaces: 2,
                showChartValueLabel: true,
                initialAngle: 0,
                chartValueStyle: defaultChartValueStyle.copyWith(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                ),
                chartType: ChartType.disc,
              )
                  : Text("Press FAB to show chart"),
            ),
          ),
        ],
      )
    );
  }
}

class StatistikData {
  double dataOpen;
  double deal;
  double noDeal;

  StatistikData({
    this.dataOpen,
    this.deal,
    this.noDeal,
  });

  factory StatistikData.fromJson(Map<String, dynamic> json) => StatistikData(
    dataOpen: json["Data Open"],
    deal: json["Deal"],
    noDeal: json["No Deal"],
  );

  Map<String, dynamic> toJson() => {
    "Data Open": dataOpen,
    "Deal": deal,
    "No Deal": noDeal,
  };
}

