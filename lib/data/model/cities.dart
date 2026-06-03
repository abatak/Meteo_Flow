import 'package:meteo_flow/core/constatnts/constants.dart';

class Cities {
  final String name;
  final double lat;
  final double lon;
  // Added to distinguish between e.i. London, Uk and London, Canada
  final String? country;

  const Cities({
    required this.name,
    required this.lat,
    required this.lon,
    this.country,
  });

  factory Cities.fromJson(
    Map<String, dynamic> json,
  ) {
    return Cities(
      name: json[kName],
      lat: (json[kLatitude] as num)
          .toDouble(),
      lon: (json[kLongitude] as num)
          .toDouble(),
      country:
          json[kCountry] as String?,
    );
  }
}
