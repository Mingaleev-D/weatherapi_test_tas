// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      json['location'] == null
          ? null
          : WeatherResponseLocation.fromJson(
              json['location'] as Map<String, dynamic>),
      json['current'] == null
          ? null
          : WeatherResponseCurrent.fromJson(
              json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };

WeatherResponseLocation _$WeatherResponseLocationFromJson(
        Map<String, dynamic> json) =>
    WeatherResponseLocation(
      json['name'] as String?,
      json['region'] as String?,
      json['country'] as String?,
      (json['lat'] as num?)?.toDouble(),
      (json['lon'] as num?)?.toDouble(),
      json['tz_id'] as String?,
      (json['localtime_epoch'] as num?)?.toInt(),
      json['localtime'] as String?,
    );

Map<String, dynamic> _$WeatherResponseLocationToJson(
        WeatherResponseLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'tz_id': instance.tzId,
      'localtime_epoch': instance.localtimeEpoch,
      'localtime': instance.localtime,
    };

WeatherResponseCurrent _$WeatherResponseCurrentFromJson(
        Map<String, dynamic> json) =>
    WeatherResponseCurrent(
      (json['last_updated_epoch'] as num?)?.toInt(),
      json['last_updated'] as String?,
      (json['temp_c'] as num?)?.toDouble(),
      (json['temp_f'] as num?)?.toDouble(),
      (json['is_day'] as num?)?.toInt(),
      json['condition'] == null
          ? null
          : WeatherResponseCurrentCondition.fromJson(
              json['condition'] as Map<String, dynamic>),
      (json['wind_mph'] as num?)?.toDouble(),
      (json['wind_kph'] as num?)?.toDouble(),
      (json['wind_degree'] as num?)?.toInt(),
      json['wind_dir'] as String?,
      (json['pressure_mb'] as num?)?.toDouble(),
      (json['pressure_in'] as num?)?.toDouble(),
      (json['precip_mm'] as num?)?.toDouble(),
      (json['precip_in'] as num?)?.toDouble(),
      (json['humidity'] as num?)?.toInt(),
      (json['cloud'] as num?)?.toInt(),
      (json['feelslike_c'] as num?)?.toDouble(),
      (json['feelslike_f'] as num?)?.toDouble(),
      (json['windchill_c'] as num?)?.toDouble(),
      (json['windchill_f'] as num?)?.toDouble(),
      (json['heatindex_c'] as num?)?.toDouble(),
      (json['heatindex_f'] as num?)?.toDouble(),
      (json['dewpoint_c'] as num?)?.toDouble(),
      (json['dewpoint_f'] as num?)?.toDouble(),
      (json['vis_km'] as num?)?.toDouble(),
      (json['vis_miles'] as num?)?.toDouble(),
      (json['uv'] as num?)?.toDouble(),
      (json['gust_mph'] as num?)?.toDouble(),
      (json['gust_kph'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherResponseCurrentToJson(
        WeatherResponseCurrent instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'last_updated': instance.lastUpdated,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDir,
      'pressure_mb': instance.pressureMb,
      'pressure_in': instance.pressureIn,
      'precip_mm': instance.precipMm,
      'precip_in': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslikeC,
      'feelslike_f': instance.feelslikeF,
      'windchill_c': instance.windchillC,
      'windchill_f': instance.windchillF,
      'heatindex_c': instance.heatindexC,
      'heatindex_f': instance.heatindexF,
      'dewpoint_c': instance.dewpointC,
      'dewpoint_f': instance.dewpointF,
      'vis_km': instance.visKm,
      'vis_miles': instance.visMiles,
      'uv': instance.uv,
      'gust_mph': instance.gustMph,
      'gust_kph': instance.gustKph,
    };

WeatherResponseCurrentCondition _$WeatherResponseCurrentConditionFromJson(
        Map<String, dynamic> json) =>
    WeatherResponseCurrentCondition(
      json['text'] as String?,
      json['icon'] as String?,
      (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WeatherResponseCurrentConditionToJson(
        WeatherResponseCurrentCondition instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };
