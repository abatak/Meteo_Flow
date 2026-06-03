// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_weather_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cityWeather)
final cityWeatherProvider = CityWeatherFamily._();

final class CityWeatherProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>>,
          Map<String, dynamic>,
          FutureOr<Map<String, dynamic>>
        >
    with
        $FutureModifier<Map<String, dynamic>>,
        $FutureProvider<Map<String, dynamic>> {
  CityWeatherProvider._({
    required CityWeatherFamily super.from,
    required ({double lat, double lon}) super.argument,
  }) : super(
         retry: null,
         name: r'cityWeatherProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cityWeatherHash();

  @override
  String toString() {
    return r'cityWeatherProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Map<String, dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, dynamic>> create(Ref ref) {
    final argument = this.argument as ({double lat, double lon});
    return cityWeather(ref, lat: argument.lat, lon: argument.lon);
  }

  @override
  bool operator ==(Object other) {
    return other is CityWeatherProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cityWeatherHash() => r'c9d104b8e98ca850b20d87ab1037b21947bdc988';

final class CityWeatherFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Map<String, dynamic>>,
          ({double lat, double lon})
        > {
  CityWeatherFamily._()
    : super(
        retry: null,
        name: r'cityWeatherProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CityWeatherProvider call({required double lat, required double lon}) =>
      CityWeatherProvider._(argument: (lat: lat, lon: lon), from: this);

  @override
  String toString() => r'cityWeatherProvider';
}
