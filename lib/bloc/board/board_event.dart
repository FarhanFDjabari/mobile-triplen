import 'package:equatable/equatable.dart';
import 'package:triplen_app/models/board_model.dart';

abstract class BoardEvent extends Equatable {
  const BoardEvent();
  @override
  List<Object> get props => [];
}

class LoadDetailBoardEvent extends BoardEvent {
  final BoardDataModel data;

  LoadDetailBoardEvent({this.data});
}
