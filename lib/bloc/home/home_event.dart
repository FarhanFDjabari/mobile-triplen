import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class InitialHomeEvent extends HomeEvent {

}

class LoadBoardsEvent extends HomeEvent {

}

class LogoutEvent extends HomeEvent {}

class SwitchHomeEvent extends HomeEvent {}

class SwitchHistoryEvent extends HomeEvent {}

class SwitchNewsEvent extends HomeEvent {}

class SwitchProfileEvent extends HomeEvent {}