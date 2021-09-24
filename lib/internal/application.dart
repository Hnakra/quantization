import 'package:flutter/material.dart';
import 'package:lab2_quantization/data/api/graph_operations.dart';
import 'package:lab2_quantization/domain/notify/home_state.dart';
import 'package:lab2_quantization/presentation/home.dart';
import 'package:lab2_quantization/presentation/themes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Квантизация',
      debugShowCheckedModeBanner: false,

      theme: ApplicationTheme.lightTheme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeState(
                originalGraphIsChecked: true,
                quantizedGraphIsChecked: true,
                smoothedGraphIsChecked: false,
                numQuantize: 10,
            ),
          )
        ],
        child: MyHomePage(),
      )


    );
  }
}
