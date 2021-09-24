import 'package:lab2_quantization/domain/models/dot.dart';
import 'package:lab2_quantization/domain/models/graph.dart';

class GenerateSmooth{
  static calculate({required Graph graph}) {
    // получаем сереину каждой ступени квантизированного графика
    Graph dots = getDotsOnQuantizedSteps(graph);
    // выполняем алгоритм усреднения в методе скользящего среднего
    Graph result = Graph();
    // кол-во значений в интервале усреднения
    int smoothIntervalLength = 3;
    // кол-во значений, которые слева и справа от графика сглаживаться не будут
    int delta = smoothIntervalLength~/2;
    // добавляем delta значений в начало графика
    for(int i = 0; i < delta; i++){
      result.add(dots.getById(i));
    }
    // получаем сглаженный график
    for(int i = smoothIntervalLength~/2; i < dots.length-smoothIntervalLength~/2; i++){
      double sum = 0;
      for(int j = i-delta; j < i+delta+1; j++){
        sum += dots.getById(j).y;
      }
      result.add(Dot(x: dots.getById(i).x, y: sum/smoothIntervalLength));
    }
    // добавляем delta значений в конец графика
    for(int i = dots.length-1-delta; i < dots.length; i++){
      result.add(dots.getById(i));
    }
    return result;
  }

  static Graph getDotsOnQuantizedSteps(Graph graph) {
    Graph result = Graph();
    for(int i = 0; i < graph.length; i++){
      if(i%3 == 0) {
        result.add(graph.getById(i));
      }
    }
    result.add(graph.getById(graph.length-1));
    return result;
  }
}