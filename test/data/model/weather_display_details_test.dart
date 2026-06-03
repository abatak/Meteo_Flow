import 'package:test/test.dart';
import 'package:meteo_flow/data/model/weather_display_details.dart';

void main() {
  group('WeatherDisplayDetails Test', () {
    test(
      'mapWeatherCode maps code 0 to Sunny with correct asset paths',
      () {
        final details =
            WeatherDisplayDetails.mapWeatherCode(
              0,
            );

        expect(
          details.description,
          'Sunny',
        );
        expect(
          details.image,
          'assets/images/sunny.png',
        );
      },
    );

    test(
      'mapWeatherCode handles groupd WMO mainly clear sky codes corrected',
      () {
        for (final code in [1, 2, 3]) {
          final details =
              WeatherDisplayDetails.mapWeatherCode(
                code,
              );

          expect(
            details.description,
            'Mainly clear',
          );

          expect(
            details.image,
            'assets/images/mainly_clear.png',
          );
        }
      },
    );

    test(
      'mapWeatherCode falls back to Cloudy for unknown or unhandled codes',
      () {
        final weatherCode1 =
            WeatherDisplayDetails.mapWeatherCode(
              61,
            );
        final weatherCode2 =
            WeatherDisplayDetails.mapWeatherCode(
              -4,
            );

        expect(
          weatherCode1.description,
          'Cloudy',
        );
        expect(
          weatherCode1.image,
          'assets/images/cloudy.png',
        );

        expect(
          weatherCode2.description,
          'Cloudy',
        );
        expect(
          weatherCode2.image,
          'assets/images/cloudy.png',
        );
      },
    );
  });
}
