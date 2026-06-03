import 'package:meteo_flow/business/entities/weather_entity.dart';
import 'package:meteo_flow/core/constatnts/constants.dart';
import 'package:meteo_flow/data/model/weather_sub_models.dart';

class WeatherModel
    extends WeatherEntity {
  WeatherModel({
    required super.latitude,
    required super.longitude,
    required super.timezone,
    required super.current,
    required super.hourly,
    required super.daily,
  });

  factory WeatherModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return WeatherModel(
      latitude: json[kLatitude],
      longitude: json[kLongitude],
      timezone: json[kTimezone],
      current: CurrentModel.fromJson(
        json[kCurrent],
      ),
      hourly: HourlyModel.fromJson(
        json[kHourly],
      ),
      daily: DailyModel.fromJson(
        json[kDaily],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kLatitude: latitude,
      kLongitude: longitude,
      kTimezone: timezone,
      kCurrent: current,
      kHourly: hourly,
      kDaily: daily,
    };
  }
}
