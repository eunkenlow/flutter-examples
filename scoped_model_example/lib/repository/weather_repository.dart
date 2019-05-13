import 'package:scoped_model_example/repository/api_provider.dart';
import 'package:scoped_model_example/models/models.dart';

final String openWeatherApiKey = 'my_key'; // change to your api key

class WeatherRepository {
  ApiProvider _apiProvider = ApiProvider();

  Future<Weather> getWeather() async {
    final String url =
        'http://api.openweathermap.org/data/2.5/weather?q=singapore&APPID=${openWeatherApiKey}';
    final res = await _apiProvider.get(url);

    return Weather.fromJson(res);
  }
}
