import 'package:dartz/dartz.dart';
import 'package:meteo_flow/core/params/weather_params.dart';
import 'package:meteo_flow/data/model/weather_model.dart';

import '../../core/errors/failure.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherModel>>
  getWeather({
    required WeatherParams params,
  });
}
