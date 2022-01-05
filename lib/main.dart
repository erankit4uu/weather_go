import 'package:flutter/material.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_go/weather_go_observer.dart';

void main() async {
  FlutterServicesBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
        () => runApp(WeatherApp(weatherRepository: WeatherRepository())),
    blocObserver: WeatherGoObserver(),
    storage: storage,
  );
}
