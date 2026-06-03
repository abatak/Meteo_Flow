import 'package:dartz/dartz.dart';
import 'package:meteo_flow/business/entities/weather_entity.dart';
import 'package:meteo_flow/business/repositories/weather_repository.dart';
import 'package:meteo_flow/core/errors/failure.dart';
import 'package:meteo_flow/core/params/weather_params.dart';
import 'package:meteo_flow/data/repositories/weather_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_weather.g.dart';

class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  Future<Either<Failure, WeatherEntity>>
  call({
    required WeatherParams params,
  }) async {
    return await repository.getWeather(
      params: params,
    );
  }
}

//* Riverpod provider
@riverpod
GetWeather getWeather(Ref ref) {
  final repository = ref.watch(
    weatherRepositoryProvider,
  );

  return GetWeather(repository);
}
