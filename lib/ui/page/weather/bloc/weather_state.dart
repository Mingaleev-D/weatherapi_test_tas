part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final WeatherResponse? weatherResponse;
  final WidgetStatus widgetStatus;
  final String currentQuery;

  const WeatherState({
    this.weatherResponse,
    this.widgetStatus = WidgetStatus.loading,
    this.currentQuery = 'Омск',
  });

  WeatherState copyWith({
    final WeatherResponse? weatherResponse,
    final WidgetStatus? widgetStatus,
    final String? currentQuery,
  }) {
    return WeatherState(
      weatherResponse: weatherResponse ?? this.weatherResponse,
      widgetStatus: widgetStatus ?? this.widgetStatus,
      currentQuery: currentQuery ?? this.currentQuery,
    );
  }

  @override
  List<Object?> get props => [weatherResponse, widgetStatus, currentQuery];
}

final class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}
