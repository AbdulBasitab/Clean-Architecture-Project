import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_architecture_project/src/features/weather/data/datasources/remote/weather_api_service.dart';
import 'package:sample_architecture_project/src/features/weather/data/repository/weather_repository_impl.dart';
import 'package:sample_architecture_project/src/features/weather/domain/repositories/weather_repository.dart';
import 'package:sample_architecture_project/src/features/weather/domain/usecases/get_current_weather.dart';

final dioClientProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());
  return dio;
});

final weatherApiServiceProvider = Provider<WeatherApiService>(
  (ref) {
    final dioClient = ref.watch(dioClientProvider);
    return WeatherApiService(dioClient: dioClient);
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
