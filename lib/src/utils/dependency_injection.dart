import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_architecture_project/src/features/weather/data/datasources/remote/weather_api_service.dart';
import 'package:sample_architecture_project/src/features/weather/data/repository/weather_repository_impl.dart';
import 'package:sample_architecture_project/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:sample_architecture_project/src/features/weather/domain/usecases/get_current_weather.dart';
import 'package:http/http.dart' as http;
final httpClientProvider = Provider<http.Client>((ref) {
  final httpclient = http.Client();
 // httpclient.interceptors.add(AwesomeDioInterceptor());
  return httpclient;
});

final weatherApiServiceProvider = Provider<WeatherApiService>(
  (ref) {
    final dioClient = ref.watch(httpClientProvider);
    return WeatherApiService(httpClient: dioClient);
  },
);

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final weatherApiService = ref.watch(weatherApiServiceProvider);
  return WeatherRepositorImpl(weatherApiService: weatherApiService);
});

final getCurrentWeatherProvider = Provider<GetCurrentWeather>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return GetCurrentWeather(weatherRepository: weatherRepository);
});
