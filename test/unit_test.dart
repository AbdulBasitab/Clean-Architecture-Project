import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_architecture_project/src/constants/data_constants.dart';
import 'package:sample_architecture_project/src/core/resources/data_state.dart';
import 'package:sample_architecture_project/src/features/weather/data/datasources/remote/weather_api_service.dart';
import 'package:sample_architecture_project/src/features/weather/data/models/weather.dart';

class MockDioClient extends Mock implements Dio{}
void main(){
group('Weather Function Test', () { 
  late WeatherApiService weatherApiService;
  late MockDioClient mockDioClient;
  late final mockSuccessResponse;
  late final mockErrorResponse;
  // setUp((){
  //   mockDioClient = MockDioClient();
  //   weatherApiService = WeatherApiService(dioClient: mockDioClient);
  // });
  setUpAll((){
    mockDioClient = MockDioClient();
    weatherApiService = WeatherApiService(dioClient: mockDioClient);
    mockSuccessResponse = Response(requestOptions: RequestOptions(
      data: {"temperature": 20.5, "feelsLikeTemp": 30.5},
    ),statusCode: 200);
    mockErrorResponse = Response(requestOptions: RequestOptions(
      data: {
        'temperature': 30
      }
    ),statusCode: 500);
  });
  test('Success State', ()async{
    //Arrange
     
    when(()=>mockDioClient.get(getCurrentWeatherByName(
          'Sargodha',
        ),)).thenAnswer((invocation)async{
          return Response(requestOptions: RequestOptions(
            data: mockSuccessResponse,
            
          ));
        });
        //Act
        final weather = await weatherApiService.getCurrentWeather('Sargodha');
        //Assert
        expect(weather, isA<DataState<WeatherModel>>());

  });
  test('Error State', ()async{
    //Arrange
    when(() {
    return  mockDioClient.get(getCurrentWeatherByName(
          '',
        ),);
    },).thenAnswer((invocation)async{
      return Response(requestOptions: RequestOptions(
        data: mockErrorResponse
      ));
    });
    //Act
    final weather = await weatherApiService.getCurrentWeather('');
    //Assert
    expect(weather, isA<DataError<WeatherModel>>().having((p0) => p0.data?.temperature, 'temprature should be 30', 30));
  });
  
});//Group
}