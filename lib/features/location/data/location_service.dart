import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<String>
  getCurrentCity() async {
    final serviceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return 'Location services disabled';
    }

    var permission =
        await Geolocator.checkPermission();

    switch (permission) {
      case LocationPermission.denied:
        return 'Location permission denied';

      case LocationPermission
          .deniedForever:
        return 'Location permentaly denied';

      case LocationPermission
          .whileInUse:
      case LocationPermission.always:
        // Permission is granted. Proceed to get the location
        return await fetchCityName();

      case LocationPermission
          .unableToDetermine:
        return 'Unable to determine location status';
    }
  }

  Future<String> fetchCityName() async {
    try {
      Position position =
          await Geolocator.getCurrentPosition(
            locationSettings:
                const LocationSettings(
                  // Using LocationAccuracy.low to save battery life
                  accuracy:
                      LocationAccuracy
                          .low,
                ),
          );
      // Placemark is part of geocoding package
      // It's simple data object that holds human-readable address information
      List<Placemark> placemarks =
          await placemarkFromCoordinates(
            position.latitude,
            position.longitude,
          );

      if (placemarks.isNotEmpty) {
        return placemarks[0].locality ??
            'Unknown City';
      }
    } catch (e) {
      return 'Vukovar';
    }
    return 'Unknown City';
  }
}
