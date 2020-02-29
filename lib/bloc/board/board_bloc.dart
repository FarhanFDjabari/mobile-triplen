import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triplen_app/models/board_detail_model.dart';
import 'package:triplen_app/models/maps_model.dart';
import 'package:triplen_app/services/board_service.dart';

import './bloc.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  @override
  BoardState get initialState => InitialBoardState();

  List<BoardDetailDataModel> listTask = List<BoardDetailDataModel>();
  List<BoardDetailDataModel> listDoneTask = List<BoardDetailDataModel>();
  List<MapsDataModel> listMaps = List<MapsDataModel>();
  DateTime datePicked;
  bool addLoading = false;
  bool isLoading = false;
  MapsDataModel selectedMaps = MapsDataModel();
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
    } else if (event is SearchMapsEvent) {
      yield* _mapEventSearchMaps(event);
    } else if (event is SelectMapsEvent) {
      yield* _mapSelectMaps(event);
    } else if (event is SaveTaskEvent) {
      yield* _mapSaveTask(event);
    } else if (event is MarkAsDoneTask) {
      yield* _mapMarkAsDone(event);
    } else if (event is DeleteTaskEvent) {
      yield* _mapDeleteTask(event);
    } else if (event is UpdateBoardEvent) {
      yield* _mapUpdateBoard(event);
    } else if (event is LoadDetailHistoryEvent) {
      yield* _mapLoadDetailHistory(event);
    }
  }

  Stream<BoardState> _mapEventLoadDetailBoard(LoadDetailBoardEvent event) async* {
    List<BoardDetailDataModel> detailBoard = await _boardService.getDetailBoard(event.data.id.toString());
    this.isLoading = false;
    this.selectedMaps = MapsDataModel();
    this.listMaps.clear();
    this.listDoneTask.clear();
    this.listTask.clear();
    yield InitialBoardState();
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

    try {
      bool result = await _boardService.deleteBoard(event.id.toString());
      if (result) {
        yield BoardDeletedState();
      } else {
        yield BoardDeletedErrorState(message: "Cek koneksi anda.");
      }
    } catch(err) {
      yield BoardDeletedErrorState(message: err.toString());
    }
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
      "date": DateFormat('yyyy-MM-dd HH:mm:ss').format(datePicked)
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

  Stream<BoardState> _mapEventSearchMaps(SearchMapsEvent event) async* {
    this.isLoading = true;
    yield InitialBoardState();
    this.listMaps = await _boardService.searchMaps(event.query);
    print(this.listMaps.toString());
    this.isLoading = false;
    yield ListMapsLoadedState();
  }

  Stream<BoardState> _mapSelectMaps(SelectMapsEvent event) async* {
    yield InitialBoardState();
    this.selectedMaps = event.mapsDataModel;
    yield MapSelectedState();
  }

  Stream<BoardState> _mapSaveTask(SaveTaskEvent event) async* {
    this.isLoading = true;
    yield InitialBoardState();
    Map<String, dynamic> payload = {
      "id": int.parse(event.id),
      "name": event.name,
      "latitude": selectedMaps.geometry.location.lat.toString(),
      "longitude": selectedMaps.geometry.location.lng.toString(),
      "location": selectedMaps.name,
      "date": DateFormat('yyyy-MM-dd HH:mm:ss').format(event.date),
      "status": 0
    };

    try {
      bool result = await _boardService.addTask(payload);
      this.addLoading = false;
      if (result) {
        yield AddTaskSuccessState();
      } else {
        yield AddTaskFailedState(message: "Gagal membuat board.");
      }
    } catch (e) {
      this.addLoading = false;
      print(e);
      yield AddTaskFailedState(message: e.toString());
    }
  }

  Stream<BoardState> _mapMarkAsDone(MarkAsDoneTask event) async* {
    yield InitialBoardState();
    Map<String, dynamic> payload = {
      "id": event.data.id,
      "budget": int.parse(event.total),
    };

    try {
      bool result = await _boardService.updateDoneTask(payload);
      if (result) {
        yield TaskUpdatedState();
      } else {
        yield TaskUpdatedFailedState(message: "Gagal merubah rencana.");
      }
    } catch (e) {
      yield TaskUpdatedFailedState(message: e.toString());
    }
  }

  Stream<BoardState> _mapDeleteTask(DeleteTaskEvent event) async* {
    yield InitialBoardState();

    try {
      bool result = await _boardService.deleteTask(event.id.toString());
      if (result) {
        yield TaskUpdatedState();
      } else {
        yield TaskUpdatedFailedState(message: "Gagal menghapus rencana.");
      }
    } catch (e) {
      yield TaskUpdatedFailedState(message: e.toString());
    }
  }

  Stream<BoardState> _mapUpdateBoard(UpdateBoardEvent event) async* {
    yield InitialBoardState();
    Map<String, dynamic> payload = {
      "idUser": int.parse(_sharedPreferences.get("USER_ID")),
      "idBoard": event.data.id,
      "name": event.data.board,
      "status": 0,
    };

    try {
      bool result = await _boardService.updateBoards(payload);
      if (result) {
        yield BoardUpdatedState();
      } else {
        yield BoardpdatedFailedState(message: "Update board gagal.");
      }
    } catch (e) {
      yield BoardpdatedFailedState(message: e.toString());
    }
  }

  Stream<BoardState> _mapLoadDetailHistory(LoadDetailHistoryEvent event) async* {
    List<BoardDetailDataModel> detailBoard = await _boardService.getDetailBoard(event.id.toString());
    this.isLoading = false;
    this.listDoneTask.clear();
    yield InitialBoardState();
    this.listDoneTask = detailBoard;
    yield HistoryDetailLoadedState();
  }
}
