import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  SharedPreferences sharedPreferences;
  String name;
  String email;
  String image;

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    sharedPreferences = await SharedPreferences.getInstance();
    // TODO: Add Logic
    if (event is InitialHomeEvent) {
      yield* _mapEventInitialHome(event);
    } else if (event is LoadBoardsEvent) {
      yield* _mapEventLoadBoards(event);
    } else if (event is LogoutEvent) {
      yield* _mapEventLogout(event);
    } else if (event is SwitchHomeEvent) {
      yield HomePageState();
    } else if (event is SwitchHistoryEvent) {
      yield HistoryPageState();
    } else if (event is SwitchNewsEvent) {
      yield NewsPageState();
    } else if (event is SwitchProfileEvent) {
      yield ProfilePageState();
    }
  }

  Stream<HomeState> _mapEventInitialHome(InitialHomeEvent event) async* {
    this.name = sharedPreferences.getString("USER_NAME");
    this.email = sharedPreferences.getString("USER_EMAIL");
    this.image = sharedPreferences.getString("USER_IMAGE");

    yield HomeLoadedDataState();
  }

  Stream<HomeState> _mapEventLoadBoards(LoadBoardsEvent event) async* {

  }

  Stream<HomeState> _mapEventLogout(LogoutEvent event) async* {
    sharedPreferences.remove("USER_NAME");
    sharedPreferences.remove("USER_EMAIL");
    sharedPreferences.remove("USER_IMAGE");
    sharedPreferences.remove("USER_ID");
    sharedPreferences.remove("USER_ID_GOOGLE");
    sharedPreferences.remove("ACCESS_TOKEN");

    yield UserLoggedOutState();
  }
}
