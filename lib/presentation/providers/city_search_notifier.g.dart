// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CitySearchNotifier)
final citySearchProvider = CitySearchNotifierProvider._();

final class CitySearchNotifierProvider
    extends $AsyncNotifierProvider<CitySearchNotifier, List<Cities>> {
  CitySearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'citySearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$citySearchNotifierHash();

  @$internal
  @override
  CitySearchNotifier create() => CitySearchNotifier();
}

String _$citySearchNotifierHash() =>
    r'97d390e650f3c3f18299f8fd4dcc3869288415b3';

abstract class _$CitySearchNotifier extends $AsyncNotifier<List<Cities>> {
  FutureOr<List<Cities>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Cities>>, List<Cities>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Cities>>, List<Cities>>,
              AsyncValue<List<Cities>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
