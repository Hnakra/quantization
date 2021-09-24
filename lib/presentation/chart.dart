import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:lab2_quantization/domain/models/dot.dart';
import 'package:lab2_quantization/domain/notify/home_state.dart';
import 'package:provider/src/provider.dart';

class Chart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Dot, double>> dots = [];
    if(context.watch<HomeState>().original != null && context.read<HomeState>().originalGraphIsChecked) {
      dots.add(charts.Series(
        id: "original",
        data: context.read<HomeState>().original!.get,
        domainFn: (Dot dot, _) => dot.x,
        measureFn: (Dot dot, _) => dot.y,
        colorFn: (Dot dot, _) => charts.ColorUtil.fromDartColor(Colors.grey.shade300),
      ),);
    }
    if(context.watch<HomeState>().quant != null && context.read<HomeState>().quantizedGraphIsChecked) {
      dots.add(charts.Series(
        id: "quant",
        data: context.read<HomeState>().quant!.get,
        domainFn: (Dot dot, _) => dot.x,
        measureFn: (Dot dot, _) => dot.y,
        colorFn: (Dot dot, _) => charts.ColorUtil.fromDartColor(Colors.green),
      ));
    }
    if(context.watch<HomeState>().smooth != null && context.read<HomeState>().smoothedGraphIsChecked) {
      dots.add(charts.Series(
        id: "smooth",
        data: context.read<HomeState>().smooth!.get,
        domainFn: (Dot dot, _) => dot.x,
        measureFn: (Dot dot, _) => dot.y,
        colorFn: (Dot dot, _) => charts.ColorUtil.fromDartColor(Colors.red),
      ));
    }

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Графики",
                style: Theme.of(context).textTheme.bodyText1),
              Expanded(
                child:
                charts.NumericComboChart(
                    dots,
                    animate: true,
                    defaultRenderer: charts.LineRendererConfig(),
                    customSeriesRenderers: [
                      charts.PointRendererConfig(
                        // ID used to link series to this renderer.
                          customRendererId: 'customPoint')
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}