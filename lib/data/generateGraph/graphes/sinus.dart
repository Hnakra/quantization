import 'dart:math';

import 'package:lab2_quantization/domain/models/dot.dart';
import 'package:lab2_quantization/domain/models/graph.dart';

class Sinus{
  static double accuracy = 0.01;
  static Graph getSinus({required double startX, required double endX}) {
    //делаем проверку для безопасности работы функции
    if(startX >= endX){
      double temp = startX;
      startX = endX;
      endX = temp;
    }
    Graph graph = Graph();
    for(double i = startX; i < endX; i+= accuracy){
      graph.add(Dot(x: i, y: sin(i)));
    }
    return graph;
  }
  static getX({required double y}) => asin(y);
}