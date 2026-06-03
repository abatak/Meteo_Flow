import 'package:dio/dio.dart';
import 'package:meteo_flow/core/errors/exceptions.dart';
import 'package:meteo_flow/core/params/weather_params.dart';
import 'package:meteo_flow/data/datasource/weather_remote_data_source.dart';
import 'package:meteo_flow/data/model/weather_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

// A fake [Dio] client used by `mocktail` to intercept network calls and return simulated API data without hitting a real server.
class MockDio extends Mock
    implements Dio {}

void main() {
  late MockDio mockDio;
  late WeatherRemoteDataSourceImpl
  dataSource;
  late WeatherParams weatherParams;

  final tMockResponseData = {
    'latitude': 45.0,
    'longitude': 19.0,
    'timezone': 'GMT',
    'current': {
      'time': '2026-06-01T15:00',
      'temperature_2m': 22.5,
      'precipitation': 0.0,
      'rain': 0.0,
      'showers': 0.0,
      'snowfall': 0.0,
      'wind_speed_10m': 12.5,
      'relative_humidity_2m': 64,
      'weather_code': 0,
    },
    'hourly': {
      'time': [
        '2026-06-01T15:00',
        '2026-06-01T16:00',
      ],
      'temperature_2m': [20.0, 21.5],
      'weather_code': [0, 1],
    },
    'daily': {
      'precipitation_hours': [1.0, 0.5],
      'precipitation_probability_max': [
        40.0,
        10.0,
      ],
    },
  };

  // setUp runs before every single test cast to give you a clean state
  setUp(() {
    mockDio = MockDio();
    dataSource =
        WeatherRemoteDataSourceImpl(
          dio: mockDio,
        );
    weatherParams = const WeatherParams(
      latitude: 45.0,
      longitude: 19.0,
    );
  });

  group(
    'WeatherRemoteDataSource.getWeatherData Tests',
    () {
      test(
        'should return WeatherModel when Dio returns a status code of 200',
        () async {
          when(
            () => mockDio.get(
              any(),
              queryParameters: any(
                named:
                    'queryParameters',
              ),
            ),
          ).thenAnswer(
            (_) async => Response(
              data: tMockResponseData,
              statusCode: 200,
              requestOptions:
                  RequestOptions(
                    path: '',
                  ),
            ),
          );

          final result =
              await dataSource
                  .getWeatherData(
                    params:
                        weatherParams,
                  );

          expect(
            result,
            isA<WeatherModel>(),
          );

          verify(
            () => mockDio.get(
              'https://api.open-meteo.com/v1/forecast',
              queryParameters: any(
                named:
                    'queryParameters',
              ),
            ),
          ).called(1);
        },
      );

      test(
        'should throw a ServerException when Dio returns a non-200 status code',
        () async {
          when(
            () => mockDio.get(
              any(),
              queryParameters: any(
                named:
                    'queryParameters',
              ),
            ),
          ).thenAnswer(
            (_) async => Response(
              data: tMockResponseData,
              statusCode: 404,
              requestOptions:
                  RequestOptions(
                    path: '',
                  ),
            ),
          );

          final result = dataSource
              .getWeatherData(
                params: weatherParams,
              );

          expect(
            result,
            throwsA(
              isA<ServerException>(),
            ),
          );
        },
      );
    },
  );
}
