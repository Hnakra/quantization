import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab2_quantization/data/api/graph_operations.dart';
import 'package:lab2_quantization/domain/models/graph.dart';
import 'package:provider/src/provider.dart';

class HomeState extends ChangeNotifier{
  // состояния чек-боксов на экране
  bool originalGraphIsChecked;
  bool quantizedGraphIsChecked;
  bool smoothedGraphIsChecked;
  // кол-во отрезков квантования
  int numQuantize;
  // оригинальный график
  Graph? original;
  // квантизованный график
  Graph? quant;
  // смазанный график
  Graph? smooth;

  HomeState({
    required this.originalGraphIsChecked,
    required this.quantizedGraphIsChecked,
    required this.smoothedGraphIsChecked,
    required this.numQuantize,
  }) {
    getData();
    ApiOperations.get.stream.listen((e) {
      switch(e["graph"]){
        case "original":
          original = e["value"];
          ApiOperations.execute.add({
            "graph": "quant",
            "value": {
              "graph": original,
              "numQuantize": numQuantize
            }
          });
          break;
        case "quant":
          quant = e["value"];
          ApiOperations.execute.add({
              "graph": "smooth",
              "value": {
                "graph": quant
              }
          });
          break;
        case "smooth":
          smooth =  e["value"];
          break;
      }
    });
  }
  void editQuantize({required int num}) {
    numQuantize = num;
    getData();
    notifyListeners();
  }
  checkOriginalGraph({required bool state}){
  originalGraphIsChecked = state;
  notifyListeners();
  }
  checkQuantizedGraph({required bool state}){
    quantizedGraphIsChecked = state;
    notifyListeners();
  }
  checkSmoothedGraph({required bool state}){
    smoothedGraphIsChecked = state;
    notifyListeners();
  }

  void getData() async {
    if(original == null) {
      ApiOperations.execute.add({
        "graph": "original",
        "value": {
          "equation": "y=sin(x)",
          "startX": 0,
          "endX": 4
        }
      });
    }
    else{
      ApiOperations.execute.add({
        "graph": "quant",
        "value": {
          "graph": original,
          "numQuantize": numQuantize
        }
      });
    }
  }
/*
    if(smooth){
      req.add({
          "graph": "smooth",
          "value": {
            "inputGraph": this.quant
          }
      });
    }*/

}