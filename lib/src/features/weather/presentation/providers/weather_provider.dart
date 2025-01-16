import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_architecture_project/src/features/weather/domain/entities/weather.dart';
import 'package:sample_architecture_project/src/utils/dependency_injection.dart';

final cityNameProvider = StateProvider<String>((ref) => '');

final weatherProvider = AsyncNotifierProvider<WeatherNotifier, WeatherEntity?>(
    () => WeatherNotifier());

class WeatherNotifier extends AsyncNotifier<WeatherEntity?> {
  Future<void> getCurrentWeatherOfCity() async {
    state = const AsyncValue.loading();
    final city = ref.read(cityNameProvider);
    if (city.isEmpty) {
      state = AsyncValue.error(
        "Please enter a city name to see the weather",
        StackTrace.current,
      );
      return;
    }
    final getCurrentWeather = ref.read(getCurrentWeatherProvider);
    final weatherData =
        await getCurrentWeather.getCurrentWeatherForLocation(city);
    if (weatherData.data != null) {
      state = AsyncValue.data(weatherData.data!);
    } else {
      state = AsyncValue.error(
        weatherData.exceptionMsg ?? 'Some error occurred',
        StackTrace.current,
      );
    }
  }

  @override
  FutureOr<WeatherEntity?> build() {
    getCurrentWeatherOfCity();
    return null;
  }
}
