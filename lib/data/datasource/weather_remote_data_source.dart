import 'package:dio/dio.dart';
import 'package:meteo_flow/core/errors/exceptions.dart';
import 'package:meteo_flow/core/params/weather_params.dart';
import 'package:meteo_flow/data/model/weather_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_remote_data_source.g.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherData({
    required WeatherParams params,
  });
}

class WeatherRemoteDataSourceImpl
    extends WeatherRemoteDataSource {
  final Dio dio;

  WeatherRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<WeatherModel> getWeatherData({
    required WeatherParams params,
  }) async {
    final respone = await dio.get(
      'https://api.open-meteo.com/v1/forecast',
      queryParameters: {
        'latitude': params.latitude,
        'longitude': params.longitude,

        'current':
            'temperature_2m,precipitation,rain,showers,snowfall,relative_humidity_2m,wind_speed_10m,weather_code',
        'hourly':
            'temperature_2m,weather_code',
        'daily':
            'precipitation_hours,precipitation_probability_max',
      },
    );
    if (respone.statusCode == 200) {
      return WeatherModel.fromJson(
        respone.data,
      );
    } else {
      throw ServerException();
    }
  }
}

//*Riverpod providers
@riverpod
Dio dio(Ref ref) {
  return Dio();
}

/// Provides the network data source implementation injected with the managed Dio provider client.
@riverpod
WeatherRemoteDataSource
weatherRemoteDataSource(Ref ref) {
  // Monitor the active base network engine instance
  final dioClient = ref.watch(
    dioProvider,
  );
  return WeatherRemoteDataSourceImpl(
    dio: dioClient,
  );
}
