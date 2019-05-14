// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$WeatherStore on _WeatherStore, Store {
  final _$weatherAtom = Atom(name: '_WeatherStore.weather');

  @override
  Weather get weather {
    _$weatherAtom.reportObserved();
    return super.weather;
  }

  @override
  set weather(Weather value) {
    _$weatherAtom.context.checkIfStateModificationsAreAllowed(_$weatherAtom);
    super.weather = value;
    _$weatherAtom.reportChanged();
  }

  final _$isLoadingAtom = Atom(name: '_WeatherStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context
        .checkIfStateModificationsAreAllowed(_$isLoadingAtom);
    super.isLoading = value;
    _$isLoadingAtom.reportChanged();
  }

  final _$errorAtom = Atom(name: '_WeatherStore.error');

  @override
  String get error {
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.context.checkIfStateModificationsAreAllowed(_$errorAtom);
    super.error = value;
    _$errorAtom.reportChanged();
  }

  final _$initWeatherAsyncAction = AsyncAction('initWeather');

  @override
  Future<dynamic> initWeather() {
    return _$initWeatherAsyncAction.run(() => super.initWeather());
  }

  final _$refreshWeatherAsyncAction = AsyncAction('refreshWeather');

  @override
  Future<dynamic> refreshWeather() {
    return _$refreshWeatherAsyncAction.run(() => super.refreshWeather());
  }

  final _$_WeatherStoreActionController =
      ActionController(name: '_WeatherStore');

  @override
  void clearError() {
    final _$actionInfo = _$_WeatherStoreActionController.startAction();
    try {
      return super.clearError();
    } finally {
      _$_WeatherStoreActionController.endAction(_$actionInfo);
    }
  }
}
