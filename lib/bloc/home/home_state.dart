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