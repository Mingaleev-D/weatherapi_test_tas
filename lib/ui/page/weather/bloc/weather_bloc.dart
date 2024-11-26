import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapi_test_tas/core/models/weather_response.dart';
import 'package:weatherapi_test_tas/core/repository/weather_repository.dart';
import 'package:weatherapi_test_tas/ui/page/common/status_widget.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial()) {
    on<FetchWeatherEvent>(_onFetchWeather);
  }

  FutureOr<void> _onFetchWeather(FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherState(widgetStatus: WidgetStatus.loading, currentQuery: event.q));

    final result = await _weatherRepository.getListContent(event.q);
    emit(result == null
        ? const WeatherState(widgetStatus: WidgetStatus.error)
        : WeatherState(
            weatherResponse: result,
            widgetStatus: WidgetStatus.content,
            currentQuery: event.q,
          ));
  }
}
