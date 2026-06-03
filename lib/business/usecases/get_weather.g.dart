// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weather.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getWeather)
final getWeatherProvider = GetWeatherProvider._();

final class GetWeatherProvider
    extends $FunctionalProvider<GetWeather, GetWeather, GetWeather>
    with $Provider<GetWeather> {
  GetWeatherProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getWeatherProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getWeatherHash();

  @$internal
  @override
  $ProviderElement<GetWeather> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetWeather create(Ref ref) {
    return getWeather(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetWeather value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetWeather>(value),
    );
  }
}

String _$getWeatherHash() => r'822c177dc8816fdd0c4127bbe363e818eddf0e60';
