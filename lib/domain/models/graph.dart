import 'dot.dart';
import 'dart:math';

class Graph{
  late List<Dot> _graph;
  Graph(){
    _graph = [];
  }
  //add({required double x, required double y}) => _graph.add(Dot(x:x, y:y));
  add(Dot dot) => _graph.add(dot);
  get get => _graph;
  addById(int id, Dot dot) => _graph.insert(id, dot);
  getById(int i) => _graph[i];
  get min => _graph.reduce((Dot current, Dot next) => current.y < next.y ? current : next);
  get max => _graph.reduce((Dot current, Dot next) => current.y > next.y ? current : next);
  get length => _graph.length;
}