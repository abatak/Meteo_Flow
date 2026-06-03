// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_city_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedCity)
final selectedCityProvider = SelectedCityProvider._();

final class SelectedCityProvider
    extends $NotifierProvider<SelectedCity, Cities?> {
  SelectedCityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCityHash();

  @$internal
  @override
  SelectedCity create() => SelectedCity();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Cities? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Cities?>(value),
    );
  }
}

String _$selectedCityHash() => r'c98b54ed561d9f740787f09e17070d412d9dbf06';

abstract class _$SelectedCity extends $Notifier<Cities?> {
  Cities? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Cities?, Cities?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Cities?, Cities?>,
              Cities?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
