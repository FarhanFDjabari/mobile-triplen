import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  const MainState();
  @override
  List<Object> get props => [];
}

class InitialMainState extends MainState {
}

class HomeLoadedState extends MainState {}