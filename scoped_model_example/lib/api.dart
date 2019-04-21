import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoped_model_example/models/models.dart';

final String openWeatherApiKey = 'my_key';

Future<Weather> getWeather() async {
  try {
    final String path =
        'http://api.openweathermap.org/data/2.5/weather?q=singapore&APPID=${openWeatherApiKey}';
    final response = await http.get(path);
    final responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return Weather.fromJson(responseJson);
    } else {
      throw Exception('Unable to get weather!');
    }
  } catch (err) {
    throw err;
  }
}
