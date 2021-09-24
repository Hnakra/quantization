import 'package:flutter/material.dart';

import 'chart.dart';
import 'check_state.dart';
import 'number_quantium.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Лаб 2 Квантизация'),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Квантизация синуса положительного X", style: Theme.of(context).textTheme.headline6,),
              ),
              Chart(),
              FieldNumQuantium(),
              CheckBoxesViewState()
            ],

          ),
        )

    );
  }
}