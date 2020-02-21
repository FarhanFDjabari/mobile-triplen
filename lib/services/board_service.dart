import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
}