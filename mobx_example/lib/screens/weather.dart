import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/store/store.dart';
import 'package:mobx_example/models/models.dart';
import 'package:mobx_example/utils/utils.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<WeatherScreen> {
  final WeatherStore _weatherStore = WeatherStore();

  @override
  void initState() {
    super.initState();
    _weatherStore.initWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in Singapore'),
      ),
      body: Observer(
        builder: (_) {
          if (_weatherStore.isLoading) {
            return _buildLoadingWidget();
          } else if (_weatherStore.error != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Utils.showSnackBar(context, _weatherStore.error);
              _weatherStore.clearError();
            });
          } else if (_weatherStore.weather = null) {
            return Center(child: Text('Much Empty :('));
          }
          return RefreshIndicator(
            onRefresh: _weatherStore.refreshWeather,
            child: _buildWeatherWidget(_weatherStore.weather),
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildWeatherWidget(Weather weather) {
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
