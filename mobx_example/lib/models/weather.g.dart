// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
      json['name'] as String,
      json['description'] as String,
      json['icon'] as String,
      (json['temperature'] as num)?.toDouble(),
      (json['wind'] as num)?.toDouble());
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'temperature': instance.temperature,
      'wind': instance.wind
    };
