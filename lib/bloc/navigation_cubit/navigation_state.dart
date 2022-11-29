part of 'navigation_cubit.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitialState extends NavigationState {}

class NavigationUpdatedState extends NavigationState {}
