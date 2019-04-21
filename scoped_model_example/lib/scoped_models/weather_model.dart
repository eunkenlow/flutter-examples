import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_example/models/models.dart';
import 'package:scoped_model_example/api.dart';

class WeatherModel extends Model {
  bool _isLoading = false;
  String _errorMessage = '';
  Weather _weather = Weather.empty();

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  Weather get weather => _weather;

  Future initWeather() async {
    try {
      _isLoading = true;
      notifyListeners();

      final Weather weather = await getWeather();
      _weather = weather;
      _isLoading = false;
      notifyListeners();
    } catch (err) {
      _errorMessage = err.message;
      _isLoading = false;
      notifyListeners();
    }
  }

  Future refreshWeather() async {
    try {
      final Weather weather = await getWeather();
      _weather = weather;
      notifyListeners();
    } catch (err) {
      _errorMessage = err.message;
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = '';
  }
}
