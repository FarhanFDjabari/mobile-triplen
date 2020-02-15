import 'package:dio/dio.dart';
import 'package:triplen_app/models/user_model.dart';

class LoginService {
  
  Future<UserDataModel> requestLogin(Map<String, dynamic> payload) async {
    Response response = await Dio().post('https://understd.xyz/users/signIn', data: payload);
    UserModel result = UserModel.fromJson(response.data);
    if (result.status) {
      return result.data;
    } else {
      return UserDataModel();
    }
  }

  Future<UserDataModel> requestRegister(Map<String, dynamic> payload) async {
    Response response = await Dio().post('https://understd.xyz/users/', data: payload);
    UserModel result = UserModel.fromJson(response.data);
    if (result.status) {
      return result.data;
    } else {
      return UserDataModel();
    }
  }
}