part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

// * 1. Fisrt Use Case That Get The Master Weather
class GetWeatherEvent extends WeatherEvent {
  final String cityName;
  const GetWeatherEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}

// * 2. Second Use Case Get The Detailed Weather
class GetDetailedWeatherEvent extends WeatherEvent {
  final String cityName;
  const GetDetailedWeatherEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}
