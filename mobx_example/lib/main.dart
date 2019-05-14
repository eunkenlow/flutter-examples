import 'package:flutter/material.dart';
import 'package:mobx_example/screens/weather.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobx Example',
      home: WeatherScreen()
    );
  }
}

