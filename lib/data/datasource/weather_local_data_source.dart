// lib/data/datasource/weather_local_data_source.dart

import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:meteo_flow/core/errors/exceptions.dart';
import 'package:meteo_flow/data/model/weather_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart'; // 1. Add this import
import 'package:meteo_flow/data/database/local_database_provider.dart';

part 'weather_local_data_source.g.dart';

abstract class WeatherLocalDataSource {
  Future<void> cacheWeather(
    WeatherModel? weatherToCache,
  );

  // Retrieves the most recently saved weather data from the local cache
  Future<WeatherModel>
  getLastWeatherData();
}

const String tableName =
    'weather_cache';
const String columnId = 'id';
const String columnData =
    'json_payload';

class WeatherLocalDataSourceSqfliteImpl
    implements WeatherLocalDataSource {
  final Database database;

  WeatherLocalDataSourceSqfliteImpl({
    required this.database,
  });

  @override
  Future<WeatherModel>
  getLastWeatherData() async {
    final List<Map<String, dynamic>>
    maps = await database.query(
      tableName,
      orderBy: '$columnId DESC',
      limit: 1,
    );

    // If a cached record exists, decode the raw JSON string back into a WeatherModel
    if (maps.isNotEmpty) {
      final jsonString =
          maps.first[columnData]
              as String;
      return WeatherModel.fromJson(
        json.decode(jsonString)
            as Map<String, dynamic>,
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheWeather(
    WeatherModel? weatherToCache,
  ) async {
    if (weatherToCache == null) {
      throw CacheException();
    }

    final jsonString = json.encode(
      weatherToCache.toJson(),
    );

    await database.insert(
      tableName,
      {columnData: jsonString},
      // If a row with the same ID already exists, delete it
      // the old stale data and overwrite it with the fresh weather data.
      conflictAlgorithm:
          ConflictAlgorithm.replace,
    );
  }
}

// This automatically creates 'weatherLocalDataSourceProvider'
@riverpod
WeatherLocalDataSource
weatherLocalDataSource(Ref ref) {
  // Watches the global database configuration layer for changes
  final db = ref.watch(
    databaseProvider,
  );

  // Return the implementation class injected with the live database instance
  return WeatherLocalDataSourceSqfliteImpl(
    database: db,
  );
}
