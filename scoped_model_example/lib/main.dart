import 'package:flutter/material.dart';
import 'package:scoped_model_example/screens/weather.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scoped Model Example',
      home: Weather()
    );
  }
}

