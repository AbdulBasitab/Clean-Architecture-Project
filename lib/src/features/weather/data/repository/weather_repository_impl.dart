import 'package:sample_architecture_project/src/core/resources/data_state.dart';
import 'package:sample_architecture_project/src/features/weather/data/datasources/remote/weather_api_service.dart';
import 'package:sample_architecture_project/src/features/weather/domain/entities/weather.dart';
import 'package:sample_architecture_project/src/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositorImpl implements WeatherRepository {
  final WeatherApiService weatherApiService;

  WeatherRepositorImpl({required this.weatherApiService});

  @override
  Future<DataState<WeatherEntity>> getCurrentWeatherForLocation(
      String cityName) async {
    try {
      var data = await weatherApiService.getCurrentWeather(cityName);
      if (data.data != null) {
        return DataSuccess(data.data!.toEntity());
      } else {
        return DataError(data.exceptionMsg ?? 'Some Exception Occured');
      }
    } catch (e) {
      return DataError(e.toString());
    }
  }
}
