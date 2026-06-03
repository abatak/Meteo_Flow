// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 1. Asynchronous database opener.
/// Riverpod code-gen will turn this into 'sqlDatabaseProvider' automatically.

@ProviderFor(sqlDatabase)
final sqlDatabaseProvider = SqlDatabaseProvider._();

/// 1. Asynchronous database opener.
/// Riverpod code-gen will turn this into 'sqlDatabaseProvider' automatically.

final class SqlDatabaseProvider
    extends
        $FunctionalProvider<AsyncValue<Database>, Database, FutureOr<Database>>
    with $FutureModifier<Database>, $FutureProvider<Database> {
  /// 1. Asynchronous database opener.
  /// Riverpod code-gen will turn this into 'sqlDatabaseProvider' automatically.
  SqlDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sqlDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sqlDatabaseHash();

  @$internal
  @override
  $FutureProviderElement<Database> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Database> create(Ref ref) {
    return sqlDatabase(ref);
  }
}

String _$sqlDatabaseHash() => r'011b5cca4229c5b33f2bdfa57ebb246345931c45';

/// 2. The synchronous gatekeeper placeholder that gets overridden in main.dart.
/// Riverpod code-gen will turn this into 'databaseProvider'.

@ProviderFor(database)
final databaseProvider = DatabaseProvider._();

/// 2. The synchronous gatekeeper placeholder that gets overridden in main.dart.
/// Riverpod code-gen will turn this into 'databaseProvider'.

final class DatabaseProvider
    extends $FunctionalProvider<Database, Database, Database>
    with $Provider<Database> {
  /// 2. The synchronous gatekeeper placeholder that gets overridden in main.dart.
  /// Riverpod code-gen will turn this into 'databaseProvider'.
  DatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $ProviderElement<Database> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Database create(Ref ref) {
    return database(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Database value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Database>(value),
    );
  }
}

String _$databaseHash() => r'eb146fac3bd4694ec643637a056cba8da509bdec';

/// 3. The data source provider that hooks into your repository layer.
/// Riverpod code-gen will turn this into 'weatherLocalDataSourceProvider'.

@ProviderFor(weatherLocalDataSource)
final weatherLocalDataSourceProvider = WeatherLocalDataSourceProvider._();

/// 3. The data source provider that hooks into your repository layer.
/// Riverpod code-gen will turn this into 'weatherLocalDataSourceProvider'.

final class WeatherLocalDataSourceProvider
    extends
        $FunctionalProvider<
          WeatherLocalDataSource,
          WeatherLocalDataSource,
          WeatherLocalDataSource
        >
    with $Provider<WeatherLocalDataSource> {
  /// 3. The data source provider that hooks into your repository layer.
  /// Riverpod code-gen will turn this into 'weatherLocalDataSourceProvider'.
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
