// lib/data/database/local_database_provider.dart

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:meteo_flow/data/datasource/weather_local_data_source.dart';

part 'local_database_provider.g.dart';

@riverpod
Future<Database> sqlDatabase(
  Ref ref,
) async {
  final databasesPath =
      await getDatabasesPath();
  final path = join(
    databasesPath,
    'meteo_flow.db',
  );

  return await openDatabase(
    path,
    version: 3,
    onCreate:
        (
          Database db,
          int version,
        ) async {
          await db.execute('''
        CREATE TABLE $tableName (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnData TEXT NOT NULL
        )
      ''');
        },
  );
}

@riverpod
Database database(Ref ref) {
  throw UnimplementedError(
    'databaseProvider must be overridden in main.dart',
  );
}

@riverpod
WeatherLocalDataSource
weatherLocalDataSource(Ref ref) {
  final db = ref.watch(
    databaseProvider,
  );
  return WeatherLocalDataSourceSqfliteImpl(
    database: db,
  );
}
