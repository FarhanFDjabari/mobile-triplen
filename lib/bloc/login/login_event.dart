import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class InitialLoginEvent extends LoginEvent {

}

class PrepareLoginEvent extends LoginEvent {

}

class RequestLoginEvent extends LoginEvent {
  final GoogleSignInAccount data;

  RequestLoginEvent({this.data});
  @override
  String toString() => "RequestLoginEvent";
}