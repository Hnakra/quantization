import 'package:flutter/material.dart';
import 'package:lab2_quantization/domain/notify/home_state.dart';
import 'package:provider/provider.dart';

class CheckBoxesViewState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeState>(
      builder: (context, state, child) => Column(
        children: [
          CheckboxListTile(
              title: Text("Оригинальный график", style: Theme.of(context).textTheme.bodyText1),
              value: state.originalGraphIsChecked,
              onChanged: (bool? value) =>
                  state.checkOriginalGraph(state: value!)),
          CheckboxListTile(
              title: Text("Квантизированный график", style: Theme.of(context).textTheme.bodyText1),
              value: state.quantizedGraphIsChecked,
              onChanged: (bool? value) =>
                  state.checkQuantizedGraph(state: value!)),
          CheckboxListTile(
              title: Text("Смазанный график", style: Theme.of(context).textTheme.bodyText1),
              value: state.smoothedGraphIsChecked,
              onChanged: (bool? value) =>
                  state.checkSmoothedGraph(state: value!)),
        ],
      ),
    );
  }
}
