// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_local_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 4. Generated Riverpod provider for this Data Source.
/// This automatically creates 'weatherLocalDataSourceProvider' for your repository!

@ProviderFor(weatherLocalDataSource)
final weatherLocalDataSourceProvider = WeatherLocalDataSourceProvider._();

/// 4. Generated Riverpod provider for this Data Source.
/// This automatically creates 'weatherLocalDataSourceProvider' for your repository!

final class WeatherLocalDataSourceProvider
    extends
        $FunctionalProvider<
          WeatherLocalDataSource,
          WeatherLocalDataSource,
          WeatherLocalDataSource
        >
    with $Provider<WeatherLocalDataSource> {
  /// 4. Generated Riverpod provider for this Data Source.
  /// This automatically creates 'weatherLocalDataSourceProvider' for your repository!
  WeatherLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weatherLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<WeatherLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WeatherLocalDataSource create(Ref ref) {
    return weatherLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeatherLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeatherLocalDataSource>(value),
    );
  }
}

String _$weatherLocalDataSourceHash() =>
    r'34358180bd9819c4c6fb01b04318b497ddd9d0c4';
