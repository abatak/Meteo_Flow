import 'package:meteo_flow/data/model/cities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// Make sure to import your exact City model package location here!

part 'selected_city_provider.g.dart';

@riverpod
class SelectedCity
    extends _$SelectedCity {
  @override
  Cities? build() {
    // Returns null initially because no search has occurred yet.
    // It will be set to default location (Vukovar)
    return null;
  }

  void selectCity(Cities city) {
    state = city;
  }
}
