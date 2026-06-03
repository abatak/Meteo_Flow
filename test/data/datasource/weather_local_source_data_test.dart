import 'package:flutter_test/flutter_test.dart';
import 'package:meteo_flow/core/errors/exceptions.dart';
import 'package:meteo_flow/data/datasource/weather_local_data_source.dart';
import 'package:meteo_flow/data/model/weather_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';

class MockDatabase extends Mock
    implements Database {}

void main() {
  late MockDatabase mockDatabase;
  late WeatherLocalDataSourceSqfliteImpl
  dataSource;

  setUp(() {
    mockDatabase = MockDatabase();
    dataSource =
        WeatherLocalDataSourceSqfliteImpl(
          database: mockDatabase,
        );
  });

  group(
    'getLastWeatherData Tests (Autoincrement History Setup)',
    () {
      test(
        'should return the latest WeatherModel by sorting by ID descending when rows exist',
        () async {
          const standardWeatherJsonString =
              '''
        {
          "latitude": 45.0,
          "longitude": 19.0,
          "timezone": "GMT",
          "current": {
            "time": "2026-06-01T15:00",
            "temperature_2m": 22.5,
            "precipitation": 0.0,
            "rain": 0.0,
            "showers": 0.0,
            "snowfall": 0.0,
            "wind_speed_10m": 12.5,
            "relative_humidity_2m": 64,
            "weather_code": 0
          },
          "hourly": {
            "time": ["2026-06-01T15:00", "2026-06-01T16:00"],
            "temperature_2m": [20.0, 21.5],
            "weather_code": [0, 1]
          },
          "daily": {
            "precipitation_hours": [1.0, 0.0],
            "precipitation_probability_max": [40.0, 10.0]
          }
        }
        ''';

          final List<
            Map<String, dynamic>
          >
          mockQueryResponse = [
            {
              columnId: 4,
              columnData:
                  standardWeatherJsonString,
            },
          ];

          when(
            () => mockDatabase.query(
              any(),
              orderBy: any(
                named: 'orderBy',
              ),
              limit: any(
                named: 'limit',
              ),
            ),
          ).thenAnswer(
            (_) async =>
                mockQueryResponse,
          );

          final result =
              await dataSource
                  .getLastWeatherData();

          expect(
            result,
            isA<WeatherModel>(),
          );
          expect(
            result.latitude,
            equals(45.0),
          );
          verify(
            () => mockDatabase.query(
              tableName,
              orderBy: '$columnId DESC',
              limit: 1,
            ),
          ).called(1);
        },
      );

      test(
        'should throw a CacheException when the database table is completely empty',
        () async {
          // Arrange
          when(
            () => mockDatabase.query(
              any(),
              orderBy: any(
                named: 'orderBy',
              ),
              limit: any(
                named: 'limit',
              ),
            ),
          ).thenAnswer(
            (_) async =>
                <
                  Map<String, dynamic>
                >[],
          );

          final call = dataSource
              .getLastWeatherData;

          expect(
            call,
            throwsA(
              isA<CacheException>(),
            ),
          );
        },
      );
    },
  );

  group('cacheWeather Tests', () {
    test(
      'should insert payload map without explicit id key so SQLite autoincrements',
      () async {
        final dummyModel =
            WeatherModel.fromJson({
              'latitude': 45.0,
              'longitude': 19.0,
              'timezone': 'GMT',
              'current': {
                'time':
                    '2026-06-01T15:00',
                'temperature_2m': 22.5,
                'precipitation': 0.0,
                'rain': 0.0,
                'showers': 0.0,
                'snowfall': 0.0,
                'wind_speed_10m': 12.5,
                'relative_humidity_2m':
                    64,
                'weather_code': 0,
              },
              'hourly': {
                'time': [
                  '2026-06-01T15:00',
                ],
                'temperature_2m': [
                  20.0,
                ],
                'weather_code': [0],
              },
              'daily': {
                'precipitation_hours': [
                  1.0,
                ],
                'precipitation_probability_max':
                    [40.0],
              },
            });

        when(
          () => mockDatabase.insert(
            any(),
            any(),
            conflictAlgorithm: any(
              named:
                  'conflictAlgorithm',
            ),
          ),
        ).thenAnswer((_) async => 1);

        await dataSource.cacheWeather(
          dummyModel,
        );

        verify(
          () => mockDatabase.insert(
            tableName,
            any(),
          ),
        ).called(1);
      },
    );

    test(
      'should throw a CacheException when passing a null model and never touch the database',
      () async {
        Future<void> call() =>
            dataSource.cacheWeather(
              null,
            );

        expect(
          call,
          throwsA(
            isA<CacheException>(),
          ),
        );
        verifyNever(
          () => mockDatabase.insert(
            any(),
            any(),
            conflictAlgorithm: any(
              named:
                  'conflictAlgorithm',
            ),
          ),
        );
      },
    );
  });
}
