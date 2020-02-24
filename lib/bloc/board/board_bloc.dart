import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triplen_app/models/board_detail_model.dart';
import 'package:triplen_app/services/board_service.dart';

import './bloc.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  @override
  BoardState get initialState => InitialBoardState();

  List<BoardDetailDataModel> listTask = List<BoardDetailDataModel>();
  List<BoardDetailDataModel> listDoneTask = List<BoardDetailDataModel>();
  DateTime datePicked;
  bool addLoading = false;
  SharedPreferences _sharedPreferences;

  BoardService _boardService = BoardService();

  @override
  Stream<BoardState> mapEventToState(
    BoardEvent event,
  ) async* {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (event is LoadDetailBoardEvent) {
      yield* _mapEventLoadDetailBoard(event);
    } else if (event is DeleteBoardEvent) {
      yield* _mapEventDeleteBoard(event);
    } else if (event is SelectDateTimeBoardEvent) {
      yield* _mapEventChangeDatePicked(event);
    } else if (event is AddBoardEvent) {
      yield* _mapEventAddBoard(event);
    }
  }

  Stream<BoardState> _mapEventLoadDetailBoard(LoadDetailBoardEvent event) async* {
    List<BoardDetailDataModel> detailBoard = await _boardService.getDetailBoard(event.data.id.toString());
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

//    try {
      bool result = await _boardService.deleteBoard(event.id.toString());
      if (result) {
        yield BoardDeletedState();
      } else {
        yield BoardDeletedErrorState(message: "Cek koneksi anda.");
      }
//    } catch(err) {
//      yield BoardDeletedErrorState(message: err.toString());
//    }
  }

  Stream<BoardState> _mapEventChangeDatePicked(SelectDateTimeBoardEvent event) async* {
    yield InitialBoardState();
    this.datePicked = event.data;
    yield DateChangedBoardState(data: event.data);
  }

  Stream<BoardState> _mapEventAddBoard(AddBoardEvent event) async* {
    yield InitialBoardState();
    this.addLoading = true;

    Map<String, dynamic> payload = {
      "idUser": int.parse(_sharedPreferences.get("USER_ID")),
      "name": event.name,
      "date": DateFormat('yyyy-MMM-dd HH:mm:ss').format(datePicked)
    };

    print(payload.toString());

    try {
      bool result = await _boardService.addBoard(payload);
      this.addLoading = false;
      if (result) {
        yield SuccessAddBoardState();
      } else {
        yield FailedAddBoardState(message: "Gagal membuat board.");
      }
    } catch (e) {
      this.addLoading = false;
      print(e);
      yield FailedAddBoardState(message: e.toString());
    }
  }
}
