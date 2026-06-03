// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WeatherNotifier)
final weatherProvider = WeatherNotifierProvider._();

final class WeatherNotifierProvider
    extends $AsyncNotifierProvider<WeatherNotifier, WeatherEntity> {
  WeatherNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weatherProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherNotifierHash();

  @$internal
  @override
  WeatherNotifier create() => WeatherNotifier();
}

String _$weatherNotifierHash() => r'70cb40be1aca598047692f34cb86736e8ae2f68d';

abstract class _$WeatherNotifier extends $AsyncNotifier<WeatherEntity> {
  FutureOr<WeatherEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<WeatherEntity>, WeatherEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WeatherEntity>, WeatherEntity>,
              AsyncValue<WeatherEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
