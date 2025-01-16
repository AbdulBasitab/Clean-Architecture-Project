import 'package:json_annotation/json_annotation.dart';
import 'package:sample_architecture_project/src/features/weather/domain/entities/weather.dart';
import 'package:sample_architecture_project/src/features/weather/domain/entities/weather_condition.dart';

part 'weather.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModel {
  @JsonKey(name: 'temp_c')
  final double temperature;
  @JsonKey(name: 'feelslike_c')
  final double feelsLikeTemp;
  @JsonKey(name: 'condition')
  final WeatherCondition weatherCondition;
  @JsonKey(name: 'wind_kph')
  final double windSpeed;
  @JsonKey(name: 'precip_mm')
  final double precipatation;
  final int humidity;
  @JsonKey(name: 'cloud')
  final int cloudCover;
  @JsonKey(name: 'is_day')
  final int isDay;
  @JsonKey(name: 'uv')
  final double uvIndex;
  const WeatherModel({
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

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  WeatherEntity toEntity() => WeatherEntity(
        temperature: temperature,
        feelsLikeTemp: feelsLikeTemp,
        weatherCondition: weatherCondition,
        windSpeed: windSpeed,
        precipatation: precipatation,
        humidity: humidity,
        cloudCover: cloudCover,
        uvIndex: uvIndex,
        isDay: isDay,
      );
}
