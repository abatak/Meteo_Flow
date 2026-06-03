import 'dart:async';
import 'package:dio/dio.dart';
import 'package:meteo_flow/data/model/cities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_search_notifier.g.dart';

@riverpod
class CitySearchNotifier
    extends _$CitySearchNotifier {
  Timer? _debounceTimer;
  final Dio _dio = Dio();

  @override
  FutureOr<List<Cities>> build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });

    return []; // initial empty state
  }

  void searchCities(String query) {
    _debounceTimer?.cancel();

    if (query.trim().length < 2) {
      state = const AsyncValue.data([]);
      return;
    }

    state = AsyncValue.loading();

    _debounceTimer = Timer(
      const Duration(milliseconds: 500),
      () async {
        const url =
            'https://geocoding-api.open-meteo.com/v1/search';

        try {
          final response = await _dio
              .get(
                url,
                queryParameters: {
                  'name': query,
                  'count': 4,
                  'language': 'en',
                  'format': 'json',
                },
              );

          if (response.statusCode !=
                  200 ||
              response.data == null) {
            throw Exception(
              'Server returned invalid status code',
            );
          }

          final data =
              response.data
                  as Map<
                    String,
                    dynamic
                  >;

          // Extract List or defults data
          final List results =
              data['results'] ?? [];

          final cities = results
              .map(
                (json) =>
                    Cities.fromJson(
                      json,
                    ),
              )
              .toList();
          state = AsyncValue.data(
            cities,
          );
        } on DioException catch (
          e,
          stack
        ) {
          // Catches external internet, timeout, and server-side connection issues.
          state = AsyncValue.error(
            e.message ??
                'A network error occurred',
            stack,
          );
        } catch (e, stack) {
          // Catches internal app crashes, typos, and JSON data parsing bugs.
          state = AsyncValue.error(
            e,
            stack,
          );
        }
      },
    );
  }
}
