import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lib/bloc/weather_bloc.dart';
import 'package:flutter_bloc_lib/data/weather_repository.dart';
import 'package:flutter_bloc_lib/screens/weather_search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Lib',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => WeatherBloc(FakeWeatherRepository()),
        child: WeatherSearchScreen(),
      ),
    );
  }
}
