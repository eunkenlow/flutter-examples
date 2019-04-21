import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:scoped_model_example/scoped_models/scoped_models.dart';
import 'package:scoped_model_example/widgets/widgets.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final _weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    _weatherModel.initWeather();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<WeatherModel>(
      model: _weatherModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather in Singapore'),
        ),
        body: ScopedModelDescendant<WeatherModel>(
          builder: (context, child, model) {
            if (model.isLoading) {
              return _buildLoadingWidget();
            } else if (model.errorMessage?.isNotEmpty ?? false) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showAlert(context, 'Error', model.errorMessage);
                return model.clearError();
              });
            }
            return RefreshIndicator(
              onRefresh: model.refreshWeather,
              child: _buildWeatherWidget(model.weather),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildWeatherWidget(weather) {
    return ListView(
      padding: EdgeInsets.all(20.0),
      children: <Widget>[
        Card(
          elevation: 2,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text(weather.name),
                  subtitle: Text(weather.description),
                  trailing: CircleAvatar(
                    radius: 40,
                    backgroundImage: (weather.icon?.isEmpty ?? true)
                        ? null
                        : displayIcon(weather.icon),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(CommunityMaterialIcons.thermometer),
                      SizedBox(width: 10),
                      Text(
                          'Temperature: ${convertToCelsius(weather.temperature)} °C'),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(CommunityMaterialIcons.weather_windy),
                    SizedBox(width: 10),
                    Text('Wind Speed: ${weather.wind.toString()} m/s'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ImageProvider displayIcon(String icon) {
    final String imageUrl = 'http://openweathermap.org/img/w/${icon}.png';
    return NetworkImage(imageUrl);
  }

  String convertToCelsius(double kelvin) {
    final double celsius = kelvin - 273.15;
    return celsius.toStringAsFixed(2);
  }
}
