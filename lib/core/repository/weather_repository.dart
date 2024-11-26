import 'package:weatherapi_test_tas/core/api/rest_api/public_client.dart';
import 'package:weatherapi_test_tas/core/models/weather_response.dart';
import 'package:weatherapi_test_tas/core/utils/appToastWrapper.dart';

class WeatherRepository {
  final PublicClient _publicClient;

  WeatherRepository(this._publicClient);

  Future<WeatherResponse?> getListContent(String q) async =>
      appToastWrapper(() => _publicClient.getWeather(q));
}
