import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_lib/data/weather_repository.dart';
import 'package:flutter_bloc_lib/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;
  WeatherBloc(this.repository);

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // Emitting a state from the asynchronous generator
    yield WeatherLoading();
    if (event is GetWeatherEvent) {
      try {
        // Emitting either Loaded or Error
        print(event.cityName);
        final weather = await repository.fetchWeather(event.cityName);
        print(weather.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield WeatherError('Could not fetch weather. Is the device online?');
      }
    } else if (event is GetDetailedWeatherEvent) {
      try {
        final weather = await repository.fetchDetailedWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield WeatherError('Could not fetch weather. Is the device online?');
      }
    }
  }

  // Add bloc-specific error handling
  @override
  void onError(Object error, StackTrace stacktrace) {
    print('$error, $stacktrace');
  }

  // This method will called before state has been updated
  @override
  void onTransition(Transition<WeatherEvent, WeatherState> transition) {
    print(transition);
  }
}
