import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_architecture_project/src/constants/data_constants.dart';
import 'package:sample_architecture_project/src/core/resources/data_state.dart';
import 'package:sample_architecture_project/src/features/weather/data/datasources/remote/weather_api_service.dart';
import 'package:sample_architecture_project/src/features/weather/data/models/weather.dart';

class MockHttpClient extends Mock implements Client{}
void main(){
  late WeatherApiService weatherApiService;
  late MockHttpClient mockHttpClient;
  final mockdata = {
    "current": {
        "temp_c": 39.4,
        "wind_kph": 9.7,
        "humidity": 26,
        "feelslike_c": 41.0,
        "condition": {
          "text": "sunny",
          "icon": "someicon"
        },
        "precip_mm": 20.0,
        "is_day": 0,
        "uv": 0.0,
        'cloud': 1
    }
  };
  group('WetherApiService', () { 
    group('getCurrentWeather', () { 
      setUp((){
        mockHttpClient = MockHttpClient();
        weatherApiService = WeatherApiService(httpClient: mockHttpClient);
      });
      test('Give WetherApiService Class when its getCurrentWeather function is called and respons code is 200 then an object of weather model should be returned ', ()async{
        //Arrange
        when(() {
          return mockHttpClient.get(Uri.parse(getCurrentWeatherByName('sargodha')));
        },).thenAnswer((invocation)async{
          return Response(json.encode(mockdata), 200);
        });

        //Act
        final weather = await weatherApiService.getCurrentWeather('sargodha');
        //Assert
        expect(weather,  allOf(isA<DataSuccess<WeatherModel>>().having((weather) => weather.data?.feelsLikeTemp, 'feelsliketemp', equals(41.0)),isA<DataSuccess<WeatherModel>>().having((weather) => weather.data?.humidity,'humidity' , anyOf(26,27))));
      });
      
      test('Give WetherApiService Class when its getCurrentWeather function is called and response code is not 200 then an error state should be returned', () async{
        //Arrange
        when(() {
          return mockHttpClient.get(Uri.parse(getCurrentWeatherByName('sargodha')));
        },).thenAnswer((invocation)async{
          return Response('{}', 500);
        });
        //Act
        final weather = await weatherApiService.getCurrentWeather('sargodha');
        //Assert
        expect(weather, isA<DataError<WeatherModel>>());
      });
    });
  });
}


