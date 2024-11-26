import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  final WeatherResponseLocation? location;
  final WeatherResponseCurrent? current;

  WeatherResponse(this.location, this.current);

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

@JsonSerializable()
class WeatherResponseLocation {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  @JsonKey(name: 'tz_id')
  final String? tzId;
  @JsonKey(name: 'localtime_epoch')
  final int? localtimeEpoch;
  final String? localtime;

  WeatherResponseLocation(this.name, this.region, this.country, this.lat, this.lon, this.tzId,
      this.localtimeEpoch, this.localtime);

  factory WeatherResponseLocation.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseLocationFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseLocationToJson(this);
}

@JsonSerializable()
class WeatherResponseCurrent {
  @JsonKey(name: 'last_updated_epoch')
  final int? lastUpdatedEpoch;
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;
  @JsonKey(name: 'temp_c')
  final double? tempC;
  @JsonKey(name: 'temp_f')
  final double? tempF;
  @JsonKey(name: 'is_day')
  final int? isDay;
  final WeatherResponseCurrentCondition? condition;
  @JsonKey(name: 'wind_mph')
  final double? windMph;
  @JsonKey(name: 'wind_kph')
  final double? windKph;
  @JsonKey(name: 'wind_degree')
  final int? windDegree;
  @JsonKey(name: 'wind_dir')
  final String? windDir;
  @JsonKey(name: 'pressure_mb')
  final double? pressureMb;
  @JsonKey(name: 'pressure_in')
  final double? pressureIn;
  @JsonKey(name: 'precip_mm')
  final double? precipMm;
  @JsonKey(name: 'precip_in')
  final double? precipIn;
  final int? humidity;
  final int? cloud;
  @JsonKey(name: 'feelslike_c')
  final double? feelslikeC;
  @JsonKey(name: 'feelslike_f')
  final double? feelslikeF;
  @JsonKey(name: 'windchill_c')
  final double? windchillC;
  @JsonKey(name: 'windchill_f')
  final double? windchillF;
  @JsonKey(name: 'heatindex_c')
  final double? heatindexC;
  @JsonKey(name: 'heatindex_f')
  final double? heatindexF;
  @JsonKey(name: 'dewpoint_c')
  final double? dewpointC;
  @JsonKey(name: 'dewpoint_f')
  final double? dewpointF;
  @JsonKey(name: 'vis_km')
  final double? visKm;
  @JsonKey(name: 'vis_miles')
  final double? visMiles;
  final double? uv;
  @JsonKey(name: 'gust_mph')
  final double? gustMph;
  @JsonKey(name: 'gust_kph')
  final double? gustKph;

  WeatherResponseCurrent(
      this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.windchillC,
      this.windchillF,
      this.heatindexC,
      this.heatindexF,
      this.dewpointC,
      this.dewpointF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph);

  factory WeatherResponseCurrent.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseCurrentFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseCurrentToJson(this);
}

@JsonSerializable()
class WeatherResponseCurrentCondition {
  final String? text;
  final String? icon;
  final int? code;

  WeatherResponseCurrentCondition(this.text, this.icon, this.code);

  factory WeatherResponseCurrentCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseCurrentConditionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseCurrentConditionToJson(this);
}
