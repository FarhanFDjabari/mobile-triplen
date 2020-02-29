import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
  @override
  List<Object> get props => [];
}

class LoadHomeEvent extends MainEvent {
}

class LoadHistoryEvent extends MainEvent {
}