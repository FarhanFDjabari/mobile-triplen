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

class DateChangedBoardState extends BoardState {
  final DateTime data;

  DateChangedBoardState({this.data});
}

class SuccessAddBoardState extends BoardState {

}

class FailedAddBoardState extends BoardState {
  final String message;

  FailedAddBoardState({this.message});
}

class ListMapsLoadedState extends BoardState {}

class MapSelectedState extends BoardState {}

class AddTaskSuccessState extends BoardState {}

class AddTaskFailedState extends BoardState {
  final String message;

  AddTaskFailedState({this.message});
}