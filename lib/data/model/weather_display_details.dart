class WeatherDisplayDetails {
  final String description;
  final String image;

  const WeatherDisplayDetails({
    required this.description,
    required this.image,
  });

  // Maps standard WMO (World Meteorological Organization) weather interpretation codes
  // directly to their corresponding [WeatherDisplayDetails] assets.
  // For example, passing code `0` returns a 'Sunny' description and the sunny asset path,
  // while unknown or unhandled codes safely fall back to a default 'Cloudy' configuration.
  static WeatherDisplayDetails
  mapWeatherCode(int code) {
    return switch (code) {
      0 => const WeatherDisplayDetails(
        description: 'Sunny',
        image:
            'assets/images/sunny.png',
      ),
      1 ||
      2 ||
      3 => WeatherDisplayDetails(
        description: 'Mainly clear',
        image:
            'assets/images/mainly_clear.png',
      ),
      45 || 48 => WeatherDisplayDetails(
        description: 'Foggy',
        image:
            'assets/images/foggy.png',
      ),
      51 ||
      53 ||
      55 => WeatherDisplayDetails(
        description: 'Drizzle',
        image:
            'assets/images/drizzle.png',
      ),
      71 ||
      73 ||
      75 => WeatherDisplayDetails(
        description: 'Sleet',
        image:
            'assets/images/sleet.png',
      ),
      80 ||
      81 ||
      82 => WeatherDisplayDetails(
        description: 'Rain showers',
        image:
            'assets/images/rain_showers.png',
      ),
      85 || 86 => WeatherDisplayDetails(
        description: 'Snowing',
        image:
            'assets/images/snowing.png',
      ),
      95 => WeatherDisplayDetails(
        description:
            'Stormy with slight rain',
        image:
            'assets/images/stormy_with_slight_rain.png',
      ),
      96 || 99 => WeatherDisplayDetails(
        description:
            'Severe thunderstorm',
        image:
            'assets/images/severe_thunderstorm.png',
      ),
      _ => WeatherDisplayDetails(
        description: 'Cloudy',
        image:
            'assets/images/cloudy.png',
      ),
    };
  }
}
