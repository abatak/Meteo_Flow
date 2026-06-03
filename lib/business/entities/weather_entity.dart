import 'package:meteo_flow/business/entities/sub_entities.dart';

class WeatherEntity {
  final double latitude;
  final double longitude;
  final String timezone;
  final CurrentEntity current;
  final HourlyEntity hourly;
  final DailyEntity daily;

  const WeatherEntity({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.current,
    required this.hourly,
    required this.daily,
  });
}
