// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_info.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(internetConnectionChecker)
final internetConnectionCheckerProvider = InternetConnectionCheckerProvider._();

final class InternetConnectionCheckerProvider
    extends
        $FunctionalProvider<
          InternetConnectionChecker,
          InternetConnectionChecker,
          InternetConnectionChecker
        >
    with $Provider<InternetConnectionChecker> {
  InternetConnectionCheckerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'internetConnectionCheckerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$internetConnectionCheckerHash();

  @$internal
  @override
  $ProviderElement<InternetConnectionChecker> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InternetConnectionChecker create(Ref ref) {
    return internetConnectionChecker(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InternetConnectionChecker value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InternetConnectionChecker>(value),
    );
  }
}

String _$internetConnectionCheckerHash() =>
    r'f8c21f815dd20c3ecb3d2bd9149dd22249575ab2';

@ProviderFor(networkInfo)
final networkInfoProvider = NetworkInfoProvider._();

final class NetworkInfoProvider
    extends $FunctionalProvider<NetworkInfo, NetworkInfo, NetworkInfo>
    with $Provider<NetworkInfo> {
  NetworkInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkInfoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkInfoHash();

  @$internal
  @override
  $ProviderElement<NetworkInfo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkInfo create(Ref ref) {
    return networkInfo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkInfo>(value),
    );
  }
}

String _$networkInfoHash() => r'0c8453f2ad6e20b35e0b53bc1eea49eb6c0b687e';
