import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final String name;
  final String description;
  final String icon;
  final double temperature;
  final double wind;

  Weather(
    this.name,
    this.description,
    this.icon,
    this.temperature,
    this.wind,
  );

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
