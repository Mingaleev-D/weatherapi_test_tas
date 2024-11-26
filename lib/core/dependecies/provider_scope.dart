import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapi_test_tas/core/api/rest_api/dio_factory.dart';
import 'package:weatherapi_test_tas/core/api/rest_api/public_client.dart';
import 'package:weatherapi_test_tas/core/repository/weather_repository.dart';
import 'package:weatherapi_test_tas/ui/page/weather/bloc/weather_bloc.dart';

class ProviderScope extends StatefulWidget {
  const ProviderScope({super.key, required this.child});

  final Widget child;

  @override
  State<ProviderScope> createState() => _ProviderScopeState();
}

class _ProviderScopeState extends State<ProviderScope> {
  late final PublicClient _publicClient;

  late final WeatherRepository _weatherRepository;

  late final WeatherBloc _weatherBloc;

  Dio publicDio = DioFactory.newInstance();

  @override
  void initState() {
    super.initState();

    _publicClient = PublicClient(publicDio);

    _weatherRepository = WeatherRepository(_publicClient);

    _weatherBloc = WeatherBloc(_weatherRepository);
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => _weatherRepository,
      child: BlocProvider<WeatherBloc>(
        create: (context) => _weatherBloc,
        child: widget.child,
      ),
    );
  }
}
