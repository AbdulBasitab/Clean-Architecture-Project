import 'package:sample_architecture_project/src/core/resources/data_state.dart';
import 'package:sample_architecture_project/src/features/weather/domain/entities/weather.dart';
import 'package:sample_architecture_project/src/features/weather/domain/repositories/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository _weatherRepository;

  GetCurrentWeather({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  Future<DataState<WeatherEntity>> getCurrentWeatherForLocation(
      String cityName) {
    return _weatherRepository.getCurrentWeatherForLocation(cityName);
  }
}
