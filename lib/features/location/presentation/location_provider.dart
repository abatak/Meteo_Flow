import 'package:meteo_flow/features/location/data/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

/// An asynchronous Riverpod provider that automatically retrieves
/// and caches the user's current physical city location.
@riverpod
Future<String> currentCity(
  Ref ref,
) async {
  // Instantiates the service class responsible for managing
  // device location permissions and GPS coordinate tracking.
  final service = LocationService();
  return service.getCurrentCity();
}
