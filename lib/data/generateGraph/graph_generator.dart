import 'package:lab2_quantization/domain/models/graph.dart';

import 'graphes/sinus.dart';

class GraphGenerator{
  static Graph? getGraph({equation, required int startX, required int endX}) {
    switch (equation) {
      case "y=sin(x)":
        return Sinus.getSinus(startX: startX.toDouble(), endX: endX.toDouble());
    }
    return null;
  }
}