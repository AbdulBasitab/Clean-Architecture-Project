import 'dart:convert';
import 'package:sample_architecture_project/src/constants/data_constants.dart';
import 'package:sample_architecture_project/src/core/resources/data_state.dart';
import 'package:sample_architecture_project/src/features/weather/data/models/weather.dart';
import 'package:http/http.dart' as http;
class WeatherApiService {
  final http.Client _httpClient;
  WeatherApiService({required http.Client httpClient}) : _httpClient = httpClient;

  Future<DataState<WeatherModel>> getCurrentWeather(String cityName) async {
    try {
      var responce = await _httpClient.get(
        Uri.parse(getCurrentWeatherByName(
          cityName,
        ),)
      );
      if (responce.statusCode == 200) {
        var data = jsonDecode(responce.body);
        return DataSuccess(
          WeatherModel.fromJson(
            data['current'],
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
