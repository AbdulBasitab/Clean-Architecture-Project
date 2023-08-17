import 'package:dio/dio.dart';
import 'package:sample_architecture_project/src/constants/data_constants.dart';
import 'package:sample_architecture_project/src/core/resources/data_state.dart';
import 'package:sample_architecture_project/src/features/weather/data/models/weather.dart';

class WeatherApiService {
  final Dio _dioClient;
  WeatherApiService({required Dio dioClient}) : _dioClient = dioClient;

  Future<DataState<WeatherModel>> getCurrentWeather(String cityName) async {
    try {
      var responce = await _dioClient.get(
        getCurrentWeatherByName(
          cityName,
        ),
      );
      if (responce.statusCode == 200) {
        return DataSuccess(
          WeatherModel.fromJson(
            responce.data['current'],
          ),
        );
      } else {
        return DataError("Failed to fetch weather");
      }
    } catch (error) {
      return DataError(error.toString());
    }
  }
}
