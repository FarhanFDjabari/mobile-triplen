import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triplen_app/models/board_detail_model.dart';
import 'package:triplen_app/models/board_model.dart';
import 'package:triplen_app/models/history_model.dart';
import 'package:triplen_app/models/maps_model.dart';

class BoardService {
  var request = Dio();

  Future<List<BoardDataModel>> getAllBoards() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      options.headers["Authorization"] = "Bearer " + sharedPreferences.getString("ACCESS_TOKEN");
      return options;
    }));
    Response response = await request.get("https://understd.xyz/boards/filter/1");

    BoardModel result = BoardModel.fromJson(response.data);
    if (result.status) {
      return result.data;
    } else {
      return List<BoardDataModel>();
    }
  }

  Future<List<HistoryDataModel>> getAllDoneBoards() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      options.headers["Authorization"] = "Bearer " + sharedPreferences.getString("ACCESS_TOKEN");
      return options;
    }));
    Response response = await request.get("https://understd.xyz/boards/history/0");

    HistoryModel result = HistoryModel.fromJson(response.data);
    if (result.status) {
      return result.data;
    } else {
      return List<HistoryDataModel>();
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

  Future<bool> addTask(Map<String, dynamic> payload) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      options.headers["Authorization"] = "Bearer " + sharedPreferences.getString("ACCESS_TOKEN");
      return options;
    }));
    print(payload.toString());
    Response response = await request.post("https://understd.xyz/task/", data: payload);
    print(response.data.toString());
    if (response.data['status']) {
      return true;
    } else {
      return false;
    }
  }
  
  Future<List<MapsDataModel>> searchMaps(String query) async {
    Response response = await request.get("https://multazamgsd.com/maps/", queryParameters: {"q": query});
    
    MapsModel mapsModel = MapsModel.fromJson(response.data);
    if (mapsModel.status == "OK") {
      return mapsModel.results;
    } else {
      return List<MapsDataModel>();
    }
  }

  Future<bool> updateDoneTask(Map<String, dynamic> payload) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      options.headers["Authorization"] = "Bearer " + sharedPreferences.getString("ACCESS_TOKEN");
      return options;
    }));
    print(payload.toString());
    Response response = await request.put("https://understd.xyz/task/finish", data: payload);
    print(response.data.toString());
    if (response.data['status']) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteTask(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      options.headers["Authorization"] = "Bearer " + sharedPreferences.getString("ACCESS_TOKEN");
      return options;
    }));
    Response response = await request.delete("https://understd.xyz/task/" + id);
    print(response.data.toString());
    if (response.data['status']) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateBoards(Map<String, dynamic> payload) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    request.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      options.headers["Authorization"] = "Bearer " + sharedPreferences.getString("ACCESS_TOKEN");
      return options;
    }));
    Response response = await request.put("https://understd.xyz/boards/", data: payload);
    print(response.data.toString());
    if (response.data['status']) {
      return true;
    } else {
      return false;
    }
  }
}