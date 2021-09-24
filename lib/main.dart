import 'package:flutter/material.dart';

import 'data/api/graph_operations.dart';
import 'internal/application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiOperations.init();
  runApp(const MyApp());
}


