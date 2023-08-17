// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'weather_condition.dart';

class WeatherEntity extends Equatable {
  final double temperature;
  final double feelsLikeTemp;
  final WeatherCondition weatherCondition;
  final double windSpeed;
  final double precipatation;
  final int humidity;
  final int cloudCover;
  final int isDay;
  final double uvIndex;

  const WeatherEntity({
    required this.temperature,
    required this.feelsLikeTemp,
    required this.weatherCondition,
    required this.windSpeed,
    required this.precipatation,
    required this.humidity,
    required this.cloudCover,
    required this.uvIndex,
    required this.isDay,
  });

  @override
  List<Object> get props {
    return [
      temperature,
      feelsLikeTemp,
      weatherCondition,
      windSpeed,
      precipatation,
      humidity,
      cloudCover,
      uvIndex,
      isDay,
    ];
  }

  @override
  bool get stringify => true;
}
