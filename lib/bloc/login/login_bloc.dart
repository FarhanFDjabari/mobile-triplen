import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triplen_app/models/user_model.dart';
import 'package:triplen_app/services/login_service.dart';

import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  SharedPreferences prefs;
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    prefs = await SharedPreferences.getInstance();
    // TODO: Add Logic
    if (event is PrepareLoginEvent) {
      yield* _mapEventPrepareLogin(event);
    } else if (event is RequestLoginEvent) {
      yield* _mapEventRequestLogin(event);
    }
  }

  Stream<LoginState> _mapEventPrepareLogin(PrepareLoginEvent event) async* {
    dynamic status = prefs.getString('ACCESS_TOKEN');
    if (status != null) {
      yield NextToHomePageState();
    } else {
      yield NextToLoginPageState();
    }
  }

  Stream<LoginState> _mapEventRequestLogin(RequestLoginEvent event) async* {
    LoginService loginService = LoginService();
    Map<String, dynamic> payload = {
      "id_google": event.data.id,
      "email": event.data.email
    };
    UserDataModel result = await loginService.requestLogin(payload);
    print(result.toJson().toString());
    if (result.id != null) {
      await prefs.setString("USER_NAME", result.name);
      await prefs.setString("USER_EMAIL", result.email);
      await prefs.setString("USER_ID", result.id.toString());
      await prefs.setString("USER_ID_GOOGLE", result.idGoogle);
      await prefs.setString("USER_IMAGE", result.imgUrl);
      await prefs.setString("ACCESS_TOKEN", result.token);

      yield LoginSuccessState();
    } else {
      Map<String, dynamic> payload = {
        "id_google": event.data.id,
        "email": event.data.email,
        "name": event.data.displayName,
        "no": 0,
        "image": event.data.photoUrl
      };
      UserDataModel response = await loginService.requestRegister(payload);
      print(response.toJson().toString());
      await prefs.setString("USER_NAME", response.name);
      await prefs.setString("USER_EMAIL", response.email);
      await prefs.setString("USER_ID", response.id.toString());
      await prefs.setString("USER_ID_GOOGLE", response.idGoogle);
      await prefs.setString("USER_IMAGE", response.imgUrl);
      await prefs.setString("ACCESS_TOKEN", response.token);

      yield LoginSuccessState();
    }
  }
}
