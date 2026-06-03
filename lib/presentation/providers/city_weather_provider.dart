import 'package:dio/dio.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:meteo_flow/data/model/weather_display_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_weather_provider.g.dart';

// global StateProvider to hold the city data selected on your SearchScreen
final selectedCityProvider =
    StateProvider<dynamic>(
      (ref) => null,
    );

@riverpod
Future<Map<String, dynamic>>
cityWeather(
  Ref ref, {
  required double lat,
  required double lon,
}) async {
  final dio = Dio();

  final response = await dio.get(
    'https://api.open-meteo.com/v1/forecast',
    queryParameters: {
      'latitude': lat,
      'longitude': lon,
      'current':
          'temperature_2m,weather_code',
      'daily':
          'weather_code,temperature_2m_max,temperature_2m_min',
      'timezone': 'auto',
    },
  );

  if (response.statusCode == 200 &&
      response.data != null) {
    final current =
        response.data['current'];

    final double temp =
        (current['temperature_2m']
                as num)
            .toDouble();
    final int code =
        current['weather_code'] as int;

    final details =
        WeatherDisplayDetails.mapWeatherCode(
          code,
        );

    // 7-day forecast
    final dailyData =
        response.data['daily'];
    final List<dynamic> times =
        dailyData['time'];
    final List<dynamic> weatherCodes =
        dailyData['weather_code'];
    final List<dynamic> maxTemps =
        dailyData['temperature_2m_max'];
    final List<dynamic> minTemps =
        dailyData['temperature_2m_min'];

    final List<Map<String, dynamic>>
    forecastList = [];

    for (
      int i = 0;
      i < times.length;
      i++
    ) {
      final int code =
          weatherCodes[i] as int;
      final double maxTemp =
          (maxTemps[i] as num)
              .toDouble();
      final double minTemp =
          (minTemps[i] as num)
              .toDouble();
      final details =
          WeatherDisplayDetails.mapWeatherCode(
            code,
          );

      forecastList.add({
        'date': times[i] as String,
        'temp_max': maxTemp,
        'temp_min': minTemp,
        'details': details,
      });
    }

    return {
      'temperature': temp,
      'details': details,
      'forecast': forecastList,
    };
  }
  throw Exception(
    'Failed to load weather data',
  );
}
