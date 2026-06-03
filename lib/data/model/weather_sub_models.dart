import 'package:meteo_flow/business/entities/sub_entities.dart';
import 'package:meteo_flow/core/constatnts/constants.dart';
import 'package:meteo_flow/data/model/weather_display_details.dart';

//! Current
class CurrentModel
    extends CurrentEntity {
  CurrentModel({
    required super.time,
    required super.temperature,
    required super.precipitation,
    required super.rain,
    required super.showers,
    required super.snowfall,
    required super.wind,
    required super.humidity,
    required super.weatherCode,
  });

  factory CurrentModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final int rawCode =
        json[kWeatherCode] as int? ?? 0;

    return CurrentModel(
      time: json[kTime],
      temperature: json[kTemperature],
      precipitation:
          json[kPrecipitation],
      rain: json[kRain],
      showers: json[kShowers],
      snowfall: json[kSnowfall],
      wind: json[kWind],
      humidity: json[kHumidity],
      weatherCode:
          WeatherDisplayDetails.mapWeatherCode(
            rawCode,
          ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kTime: time,
      kPrecipitation: precipitation,
      kRain: rain,
      kShowers: showers,
      kSnowfall: snowfall,
      kWind: wind,
      kHumidity: humidity,
      kWeatherCode:
          weatherCode.description,
    };
  }
}

//! Hourly
class HourlyModel extends HourlyEntity {
  HourlyModel({
    required super.time,
    required super.temperature,
    required super.weatherCode,
  });

  factory HourlyModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return HourlyModel(
      time: List<String>.from(
        json[kTime],
      ),

      temperature: List<double>.from(
        //* it's need to be maped because Dart only see 'dynamic' value
        //* since temperature is double value, needs to be converted as Double
        json[kTemperature].map(
          (item) =>
              (item as num).toDouble(),
        ),
      ),

      weatherCode: List<int>.from(
        (json[kWeatherCode]).map(
          (item) => item as int,
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kTime: time,
      kTemperature: temperature,
      kWeatherCode: weatherCode,
    };
  }
}

//! Daily
class DailyModel extends DailyEntity {
  DailyModel({
    required super.precipitationHours,
    required super.precipitationProbabilityMax,
  });

  factory DailyModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return DailyModel(
      precipitationHours:
          List<double>.from(
            json[kPrecipitationHours]
                .map(
                  (item) =>
                      (item as num)
                          .toDouble(),
                ),
          ),
      precipitationProbabilityMax:
          List<double>.from(
            json[kPrecipitationProbabilityMax]
                .map(
                  (item) =>
                      (item as num)
                          .toDouble(),
                ),
          ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kPrecipitationHours:
          precipitationHours,
      kPrecipitationProbabilityMax:
          precipitationProbabilityMax,
    };
  }
}
