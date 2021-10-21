part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

///
/// * How many different states can the UI Appear
///

// 1. Showing loading indicator when fetching weather data - loading state
class WeatherLoading extends WeatherState {
  const WeatherLoading();
  @override
  List<Object> get props => null;
}

// 2. Weather is loaded - Success State
class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded(this.weather);

  @override
  List<Object> get props => [weather];
}

// 3. Error State
class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);
  @override
  List<Object> get props => [message];
}
