import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class InitialHomeState extends HomeState {
}

class HomeLoadedDataState extends HomeState {

}

class UserLoggedOutState extends HomeState {}

class HomePageState extends HomeState {}

class HistoryPageState extends HomeState {}

class NewsPageState extends HomeState {}

class ProfilePageState extends HomeState {}