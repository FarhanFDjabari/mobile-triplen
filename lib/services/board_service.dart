import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triplen_app/models/board_detail_model.dart';
import 'package:triplen_app/models/board_model.dart';

class BoardService {
  var request = Dio();

  Future<List<BoardDataModel>> getAllBoards() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      options.headers["Authorization"] = "Bearer " + sharedPreferences.getString("ACCESS_TOKEN");
      return options;
    }));
    Response response = await request.get("https://understd.xyz/boards");

    BoardModel result = BoardModel.fromJson(response.data);
    if (result.status) {
      return result.data;
    } else {
      return List<BoardDataModel>();
    }
  }

  Future<List<BoardDetailDataModel>> getDetailBoard(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      options.headers["Authorization"] = "Bearer " + sharedPreferences.getString("ACCESS_TOKEN");
      return options;
    }));
    Response response = await request.get("https://understd.xyz/boards/" + id);

    BoardDetailModel result = BoardDetailModel.fromJson(response.data);
    if (result.status) {
      return result.data;
    } else {
      return List<BoardDetailDataModel>();
    }
  }

  Future<bool> deleteBoard(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      options.headers["Authorization"] = "Bearer " + sharedPreferences.getString("ACCESS_TOKEN");
      return options;
    }));
    Response response = await request.delete("https://understd.xyz/boards/" + id);
    print(response.data.toString());
    if (response.data['status']) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addBoard(Map<String, dynamic> payload) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      options.headers["Authorization"] = "Bearer " + sharedPreferences.getString("ACCESS_TOKEN");
      return options;
    }));
    Response response = await request.post("https://understd.xyz/boards/", data: payload);
    print(response.data.toString());
    if (response.data['status']) {
      return true;
    } else {
      return false;
    }
  }
}