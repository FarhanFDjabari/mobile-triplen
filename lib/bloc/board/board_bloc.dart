import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:triplen_app/models/board_detail_model.dart';
import 'package:triplen_app/services/board_service.dart';

import './bloc.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  @override
  BoardState get initialState => InitialBoardState();

  List<BoardDetailDataModel> listTask = List<BoardDetailDataModel>();
  List<BoardDetailDataModel> listDoneTask = List<BoardDetailDataModel>();

  @override
  Stream<BoardState> mapEventToState(
    BoardEvent event,
  ) async* {
    if (event is LoadDetailBoardEvent) {
      yield* _mapEventLoadDetailBoard(event);
    } else if (event is DeleteBoardEvent) {
      yield* _mapEventDeleteBoard(event);
    }
  }

  Stream<BoardState> _mapEventLoadDetailBoard(LoadDetailBoardEvent event) async* {
    BoardService boardService = BoardService();
    List<BoardDetailDataModel> detailBoard = await boardService.getDetailBoard(event.data.id.toString());
    detailBoard.forEach((task) {
      if (task.status == 0) {
        this.listTask.add(task);
      } else {
        this.listDoneTask.add(task);
      }
    });
    yield BoardDetailLoadedState(data: event.data);
  }

  Stream<BoardState> _mapEventDeleteBoard(DeleteBoardEvent event) async* {
    yield InitialBoardState();

    BoardService boardService = BoardService();
    try {
      bool result = await boardService.deleteBoard(event.id.toString());
      if (result) {
        yield BoardDeletedState();
      } else {
        yield BoardDeletedErrorState(message: "Cek koneksi anda.");
      }
    } catch(err) {
      yield BoardDeletedErrorState(message: err.toString());
    }
  }
}
