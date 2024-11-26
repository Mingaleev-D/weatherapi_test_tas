import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapi_test_tas/ui/page/common/status_widget.dart';
import 'package:weatherapi_test_tas/ui/page/weather/bloc/weather_bloc.dart';
import 'package:weatherapi_test_tas/ui/page/weather/widgets/weather_content.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late final WeatherBloc _weatherBloc;
  late final TextEditingController _searchController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _weatherBloc = context.read<WeatherBloc>();
    _weatherBloc.add(const FetchWeatherEvent(q: 'Омск'));
    _searchController = TextEditingController(text: 'Омск');

    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onSubmitted: (value) => _onSearch(),
              decoration: InputDecoration(
                hintText: 'Введите название города',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return StatusWidget(
              status: state.widgetStatus,
              error: CustomErrorWidget(
                message: 'Произошла ошибка',
                onRetryPress: () {
                  _weatherBloc.add(FetchWeatherEvent(q: state.currentQuery));
                },
              ),
              onRetryPress: () {
                _weatherBloc.add(FetchWeatherEvent(q: state.currentQuery));
              },
              onRefresh: () async {
                final currentQuery = _searchController.text.trim().isNotEmpty
                    ? _searchController.text.trim()
                    : 'Омск';
                _weatherBloc.add(FetchWeatherEvent(q: currentQuery));
              },
              child: state.weatherResponse != null
                  ? WeatherContent(weatherResponse: state.weatherResponse!)
                  : ElevatedButton(
                      onPressed: _onSearch,
                      child: const Text('Загрузить погоду'),
                    ),
            );
          },
        ),
      ),
    );
  }

  void _onSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      _weatherBloc.add(FetchWeatherEvent(q: query));
      FocusScope.of(context).unfocus();
    }
  }

  void _startTimer() {
    // Таймер будет запускать событие обновления каждые 60 минут
    _timer = Timer.periodic(const Duration(hours: 1), (timer) {
      final currentQuery = _weatherBloc.state.currentQuery;
      _weatherBloc.add(FetchWeatherEvent(q: currentQuery));
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
