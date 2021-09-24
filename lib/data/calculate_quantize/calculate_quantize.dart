import 'package:lab2_quantization/domain/models/dot.dart';
import 'package:lab2_quantization/domain/models/graph.dart';

class GenerateQuantize{
  static calculate({required Graph graph, required int numQuantize}) {
    double stepQuantize = (graph.max.y - graph.min.y) / numQuantize;
    // получаем точки на графике в местах пересечения линий квантизации
    Graph dots = getQuantizationLinePoints(graph:graph, stepQuantize: stepQuantize);
    // рисуем ступеньки
    Graph quantizedGraph = drawQuantizedSteps(dots);
    return quantizedGraph;
  }

  static Graph getQuantizationLinePoints({required Graph graph, required double stepQuantize}) {
    // "чертим" линии квантизации
    List<double> linesQuantization = getLinesQuantization(graph:graph, stepQuantize: stepQuantize);
    // постороим массив длин каждой точки до ближайшей линии
    List<double> lengths = [];
    for(Dot dot in graph.get) {
      lengths.add(calculateDistance(linesQuantization: linesQuantization, dot: dot));
    }
    Graph result = Graph();
    // перебираем точки, рассматривая двух близжайших соседей
    for(int i = 1; i < graph.length-1; i++){
      if(lengths[i-1] > lengths[i] && lengths[i] < lengths[i+1]){
        result.add(Dot(x: graph.getById(i).x, y: graph.getById(i).y));
      }
    }
    return result;
  }
  // у каждой точки выясняем минимальное расстояние до ближайшей линии
  static double calculateDistance({required List<double> linesQuantization, required Dot dot}) {
    List<double> lengths = [];
    for(double line in linesQuantization){
      lengths.add((dot.y - line).abs());
    }
    return lengths.reduce((double current, double next) => current < next ? current : next);
  }

  static List<double> getLinesQuantization({required Graph graph, required double stepQuantize}) {
    List<double> lineQuantization = [];
    for(double i = graph.min.y; i <= graph.max.y; i+= stepQuantize) {
      lineQuantization.add(i);
    }
    return lineQuantization;
  }

  static Graph drawQuantizedSteps(Graph dots) {
    Graph quantizedGraph = Graph();
    // рисование первой точки
    quantizedGraph.add(Dot(x: dots.getById(0).x, y: dots.getById(0).y));
    // рисование ступеньки (по 3 точки на итерацию цикла)
    for(int i = 0; i < dots.length-1; i++){
      Dot dot1 = dots.getById(i);
      Dot dot2 = dots.getById(i+1);
      double delta = (dot1.x-dot2.x).abs()/2;
      quantizedGraph.add(Dot(x: dot1.x+delta, y: dot1.y));
      quantizedGraph.add(Dot(x: dot2.x-delta, y: dot2.y));
      quantizedGraph.add(Dot(x: dot2.x, y: dot2.y));
    }
    return quantizedGraph;
  }
}