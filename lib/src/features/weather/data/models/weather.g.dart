// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      temperature: (json['temp_c'] as num).toDouble(),
      feelsLikeTemp: (json['feelslike_c'] as num).toDouble(),
      weatherCondition:
          WeatherCondition.fromJson(json['condition'] as Map<String, dynamic>),
      windSpeed: (json['wind_kph'] as num).toDouble(),
      precipatation: (json['precip_mm'] as num).toDouble(),
      humidity: json['humidity'] as int,
      cloudCover: json['cloud'] as int,
      uvIndex: (json['uv'] as num).toDouble(),
      isDay: json['is_day'] as int,
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'temp_c': instance.temperature,
      'feelslike_c': instance.feelsLikeTemp,
      'condition': instance.weatherCondition.toJson(),
      'wind_kph': instance.windSpeed,
      'precip_mm': instance.precipatation,
      'humidity': instance.humidity,
      'cloud': instance.cloudCover,
      'is_day': instance.isDay,
      'uv': instance.uvIndex,
    };
