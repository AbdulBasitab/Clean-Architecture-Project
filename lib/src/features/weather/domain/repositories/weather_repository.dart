import 'package:sample_architecture_project/src/core/resources/data_state.dart';
import 'package:sample_architecture_project/src/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherEntity>> getCurrentWeatherForLocation(
    String cityName,
  );

  /* All the contracts or methods related to this feature would
    be here */
}
