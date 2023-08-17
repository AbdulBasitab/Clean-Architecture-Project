import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_architecture_project/src/features/weather/domain/entities/weather.dart';
import 'package:sample_architecture_project/src/features/weather/domain/usecases/get_current_weather.dart';
import 'package:sample_architecture_project/src/utils/dependency_injection.dart';

final cityNameProvider = StateProvider<String>((ref) => '');

final weatherProvider =
    StateNotifierProvider<WeatherNotifier, AsyncValue<WeatherEntity>>((ref) {
  final getCurrentWeather = ref.watch(getCurrentWeatherProvider);
  return WeatherNotifier(ref: ref, getCurrentWeather: getCurrentWeather);
});

class WeatherNotifier extends StateNotifier<AsyncValue<WeatherEntity>> {
  WeatherNotifier(
      {required Ref ref, required GetCurrentWeather getCurrentWeather})
      : _getCurrentWeather = getCurrentWeather,
        _ref = ref,
        super(AsyncValue.error(
          "Enter a city name to search for its weather",
          StackTrace.current,
        ));

  final Ref _ref;
  final GetCurrentWeather _getCurrentWeather;

  Future<void> getCurrentWeatherOfCity() async {
    state = const AsyncValue.loading();
    final city = _ref.read(cityNameProvider);
    var weatherData =
        await _getCurrentWeather.getCurrentWeatherForLocation(city);
    if (weatherData.data != null) {
      state = AsyncValue.data(weatherData.data!);
    } else {
      state = AsyncValue.error(
        weatherData.exceptionMsg ?? 'Some error occurred',
        StackTrace.current,
      );
    }
  }
}
