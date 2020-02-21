import 'package:equatable/equatable.dart';
import 'package:triplen_app/models/board_model.dart';

abstract class BoardState extends Equatable {
  const BoardState();
  @override
  List<Object> get props => [];
}

class InitialBoardState extends BoardState {
}

class BoardDetailLoadedState extends BoardState {
  final BoardDataModel data;

  BoardDetailLoadedState({this.data});
}

class BoardDeletedState extends BoardState {
}

class BoardDeletedErrorState extends BoardState {
  final String message;

  BoardDeletedErrorState({this.message});
}