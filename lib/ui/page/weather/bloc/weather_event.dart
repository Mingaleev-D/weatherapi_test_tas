part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
}

final class FetchWeatherEvent extends WeatherEvent {
  final String q;

  const FetchWeatherEvent({
    required this.q,
  });

  @override
  List<Object?> get props => [q];
}
