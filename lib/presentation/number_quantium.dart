import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab2_quantization/domain/notify/home_state.dart';
import 'package:provider/src/provider.dart';

class FieldNumQuantium extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateFieldNumQuantium();
}

class _StateFieldNumQuantium extends State<FieldNumQuantium> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.addListener(() =>
          context.read<HomeState>().editQuantize(
            num: _textController.text.isEmpty? 0: int.parse(_textController.text)
        )
    );
    // положим старотовое значение в поле только тогда, когда дерево виджетов уже отобразится
    Future.delayed(const Duration(), () {
      _textController.value = TextEditingValue(
          text: context.read<HomeState>().numQuantize.toString()
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            Text("Число отрезков квантования:", style: Theme.of(context).textTheme.bodyText1),
            TextField(
              controller: _textController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ]
            ),
          ],
        ),
      ),
    );
  }
}