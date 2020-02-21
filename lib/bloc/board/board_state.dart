import 'package:equatable/equatable.dart';

abstract class BoardState extends Equatable {
  const BoardState();
  @override
  List<Object> get props => [];
}

class InitialBoardState extends BoardState {
}

class BoardDetailLoadedState extends BoardState {}