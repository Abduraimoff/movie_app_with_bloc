import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/screen_factory/screen_factory.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final List<Widget> screens = [
    ScreenFactory.makeHomePage(),
    ScreenFactory.makeLoginPage(),
    ScreenFactory.makeIntroPage(),
    const Center(child: Text('analysis')),
  ];

  // List get screens => _screens.toList();

  int _selectedIndex = 0;

  int get index => _selectedIndex;

  NavigationCubit() : super(NavigationInitialState());

  void setIndex(int index) {
    print(index);
    _selectedIndex = index;
    print('Selected index ${_selectedIndex}');
    emit(NavigationUpdatedState());
  }
}
