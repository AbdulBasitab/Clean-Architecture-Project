import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_condition.g.dart';

@JsonSerializable()
class WeatherCondition extends Equatable {
  final String text;
  final String icon;
  const WeatherCondition({
    required this.text,
    required this.icon,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherConditionToJson(this);

  @override
  List<Object> get props => [text, icon];

  @override
  bool get stringify => true;
}
