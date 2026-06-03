//! Current
import 'package:meteo_flow/data/model/weather_display_details.dart';

class CurrentEntity {
  final String time;
  final double temperature;
  final double precipitation;
  final double rain;
  final double showers;
  final double snowfall;
  final double wind;
  final int humidity;
  final WeatherDisplayDetails
  weatherCode;

  const CurrentEntity({
    required this.time,
    required this.temperature,
    required this.precipitation,
    required this.rain,
    required this.showers,
    required this.snowfall,
    required this.wind,
    required this.humidity,
    required this.weatherCode,
  });
}

//! Hourly

class HourlyEntity {
  final List<String> time;
  final List<double> temperature;
  final List<int> weatherCode;
  const HourlyEntity({
    required this.time,
    required this.temperature,
    required this.weatherCode,
  });
}

//! Daily
class DailyEntity {
  final List<double> precipitationHours;
  final List<double>
  precipitationProbabilityMax;

  const DailyEntity({
    required this.precipitationHours,
    required this.precipitationProbabilityMax,
  });
}
