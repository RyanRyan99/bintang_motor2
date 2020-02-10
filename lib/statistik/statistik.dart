import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Statistik extends StatefulWidget {

  final Widget child;
  Statistik({Key key, this.child}) : super(key: key);
  @override
  _StatistikState createState() => _StatistikState();
}

class _StatistikState extends State<Statistik> {

  //Chart
  List<charts.Series<Task,String>>_seriesPieData;

  _generateData(){
    var pieData = [
      new Task('Deal', 50.0, Color(0xff3366cc)),
      new Task('No Deal', 20.0, Color(0xff109618)),
      new Task('Batal', 30.0, Color(0xffff9900)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.colorval),
        id: "Chart Bintang Motor",
        data: pieData,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}'
      )
    );

    void initState(){
      super.initState();
      _seriesPieData = List<charts.Series<Task, String>>();
      _generateData();
    }
  }
  //Chart
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
              height: 450,
              width: double.infinity,
              child: new Stack(
                children: <Widget>[
                  Container(
                    child: charts.PieChart(
                      _seriesPieData,
                      animate: true,
                      animationDuration: Duration(seconds: 5),
                      behaviors: [
                        new charts.DatumLegend(
                          outsideJustification: charts.OutsideJustification.endDrawArea,
                          horizontalFirst: true,
                          desiredMaxRows: 2,
                          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                          entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontSize: 11,),
                        )
                      ],
                      defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                            labelPosition: charts.ArcLabelPosition.inside)
                        ]
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Task{
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}