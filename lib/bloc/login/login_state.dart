import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class InitialLoginState extends LoginState {

}

class UserLoggedState extends LoginState {

}

class UserNotLoggedState extends LoginState {}

class LoginFailedState extends LoginState {
  final String message;

  LoginFailedState({this.message});
}

class LoginSuccessState extends LoginState {

}

class NextToHomePageState extends LoginState {

}

class NextToLoginPageState extends LoginState {

}