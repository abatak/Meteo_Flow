// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_nav_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BottomNavNotifier)
final bottomNavProvider = BottomNavNotifierProvider._();

final class BottomNavNotifierProvider
    extends $NotifierProvider<BottomNavNotifier, int> {
  BottomNavNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bottomNavProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bottomNavNotifierHash();

  @$internal
  @override
  BottomNavNotifier create() => BottomNavNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$bottomNavNotifierHash() => r'78c43e1e941e713f3a5abe637203f1bf5142cfb6';

abstract class _$BottomNavNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
