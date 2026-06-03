import 'package:meteo_flow/business/entities/weather_entity.dart';
import 'package:meteo_flow/core/params/weather_params.dart';
import 'package:meteo_flow/data/repositories/weather_repository_impl.dart'; // Make sure this file contains your repository provider!
import 'package:meteo_flow/presentation/providers/city_weather_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_notifier.g.dart';

@riverpod
class WeatherNotifier
    extends _$WeatherNotifier {
  @override
  FutureOr<WeatherEntity>
  build() async {
    // 1. Get the repository instance
    final repository = ref.watch(
      weatherRepositoryProvider,
    );

    final selectedCity = ref.watch(
      selectedCityProvider,
    );

    final double lat =
        selectedCity?.lat ?? 45.3431;
    final double lon =
        selectedCity?.lon ?? 19.0;

    // Vukovar location
    final weatherParams = WeatherParams(
      latitude: lat,
      longitude: lon,
    );

    // Network call
    final result = await repository
        .getWeather(
          params: weatherParams,
        );

    // Handling exceptions
    return result.fold(
      (failure) => throw failure,
      (weather) => weather,
    );
  }

  Future<void> fetchWeather({
    required double lat,
    required double lon,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        final repository = ref.read(
          weatherRepositoryProvider,
        );

        final weatherParams =
            WeatherParams(
              latitude: lat,
              longitude: lon,
            );

        final result = await repository
            .getWeather(
              params: weatherParams,
            );

        return result.fold(
          (failure) => throw failure,
          (weather) => weather,
        );
      },
    );
  }
}
