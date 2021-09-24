import 'dart:async';

import 'package:lab2_quantization/data/calculate_quantize/calculate_quantize.dart';
import 'package:lab2_quantization/data/calculate_smooth/calculate_smooth.dart';
import 'package:lab2_quantization/data/generateGraph/graph_generator.dart';

class ApiOperations {
  static final StreamController get = StreamController();
  static final StreamController<Map> execute = StreamController();

  static void init() {
    execute.stream.listen((Map command) {
        executeCommand(command);
    });
  }

  static void executeCommand(Map command) {
    String commandName = command["graph"];
    Map properties = command["value"];
    switch (commandName) {
      case "original":
        get.add({
          "graph": "original",
          "value": GraphGenerator.getGraph(
            equation: properties["equation"],
            startX: properties["startX"],
            endX: properties["endX"],
          )
        });
        break;
      case "quant":
        get.add({
          "graph": "quant",
          "value": GenerateQuantize.calculate(
              graph: properties["graph"],
              numQuantize: properties["numQuantize"]
          )
        });
        break;
      case "smooth":
        get.add({
          "graph": "smooth",
          "value": GenerateSmooth.calculate(
              graph: properties["graph"]
          )
        });
        break;
    }
  }
}
