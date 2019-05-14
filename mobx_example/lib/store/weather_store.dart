import 'package:mobx/mobx.dart';
import 'package:mobx_example/models/models.dart';
import 'package:mobx_example/repository/repository.dart';

part 'weather_store.g.dart';

class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore implements Store {
  final WeatherRepository _weatherRepository = WeatherRepository();

  @observable
  Weather weather;

  @observable
  bool isLoading = false;

  @observable
  String error;

  @action
  Future initWeather() async {
    isLoading = true;
    try {
      final res = await _weatherRepository.getWeather();
      weather = res;
    } catch (err) {
      error = err.message;
    }
    isLoading = false;
  }

  @action
  Future refreshWeather() async {
    try {
      final res = await _weatherRepository.getWeather();
      weather = res;
    } catch (err) {
      error = err.message;
    }
  }

  @action
  void clearError() {
    error = null;
  }
}
