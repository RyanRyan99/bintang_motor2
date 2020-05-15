import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieCharts extends StatefulWidget {
  @override
  _PieChartsState createState() => _PieChartsState();
}

class _PieChartsState extends State<PieCharts> {

  Future<StatistikData> getData() async {
    final response = await http.get("https://bintang-niagajaya.000webhostapp.com/api_statistik.php");
    if(response.statusCode == 200){
      return StatistikData.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Error');
    }
  }
  bool toggle = false;
  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.grey[400],
    Colors.red[200],
  ];
  void initState() {
    super.initState();
    dataMap.putIfAbsent("Deal", () =>  27);
    dataMap.putIfAbsent("No Deal", () => 33.8);
    dataMap.putIfAbsent("Data Open", () => 30);
    setState(() {
      toggle = !toggle;
      getData();
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
                animationDuration: Duration(milliseconds: 800),
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
                decimalPlaces: 1,
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

List<StatistikData> statistikDataFromJson(String str) => List<StatistikData>.from(json.decode(str).map((x) => StatistikData.fromJson(x)));

String statistikDataToJson(List<StatistikData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StatistikData {
  int dataOpen;
  int deal;
  double noDeal;

  StatistikData({
    this.dataOpen,
    this.deal,
    this.noDeal,
  });

  factory StatistikData.fromJson(Map<String, dynamic> json) => StatistikData(
    dataOpen: json["Data Open"],
    deal: json["Deal"],
    noDeal: json["No Deal"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "Data Open": dataOpen,
    "Deal": deal,
    "No Deal": noDeal,
  };
}

