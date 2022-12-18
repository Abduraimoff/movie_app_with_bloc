import 'dart:developer';

import 'package:bloc/bloc.dart';

class BlocsObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {}

  @override
  void onClose(BlocBase bloc) {
    log('Closed: ${bloc.runtimeType}');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('Created: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('Error: ${bloc.runtimeType} $error // $stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('${bloc.runtimeType} => $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
