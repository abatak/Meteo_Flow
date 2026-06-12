import 'package:dartz/dartz.dart';
import 'package:meteo_flow/business/repositories/weather_repository.dart';
import 'package:meteo_flow/core/connection/network_info.dart';
import 'package:meteo_flow/core/errors/failure.dart';
import 'package:meteo_flow/core/params/weather_params.dart';
import 'package:meteo_flow/data/datasource/weather_local_data_source.dart';
import 'package:meteo_flow/data/datasource/weather_remote_data_source.dart';
import 'package:meteo_flow/data/model/weather_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_repository_impl.g.dart';

class WeatherRepositoryImpl
    implements WeatherRepository {
  final WeatherLocalDataSource
  localDataSource;

  final WeatherRemoteDataSource
  remoteDataSource;

  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, WeatherModel>>
  getWeather({
    required WeatherParams params,
  }) async {
    if (await networkInfo
        .isConnected) {
      try {
        //  Fetch the latest weather conditions from the internet API
        final remoteSource =
            await remoteDataSource
                .getWeatherData(
                  params: params,
                );

        // Save a duplicate payload copy into local SQLite storage for offline fallback usage
        await localDataSource
            .cacheWeather(remoteSource);

        return Right(remoteSource);
      } on ServerFailure {
        return Left(
          ServerFailure(
            errorMessage:
                'This is a server exception',
          ),
        );
      }
    } else {
      try {
        final localSource =
            await localDataSource
                .getLastWeatherData();

        return Right(localSource);
      } on CacheFailure {
        return Left(
          CacheFailure(
            errorMessage:
                'No local data found',
          ),
        );
      }
    }
  }
}

@riverpod
WeatherRepository weatherRepository(
  Ref ref,
) {
  // Pulls all three source dependencies reactively and injects them into the implementation class
  return WeatherRepositoryImpl(
    localDataSource: ref.watch(
      weatherLocalDataSourceProvider,
    ),
    remoteDataSource: ref.watch(
      weatherRemoteDataSourceProvider,
    ),
    networkInfo: ref.watch(
      networkInfoProvider,
    ),
  );
}
