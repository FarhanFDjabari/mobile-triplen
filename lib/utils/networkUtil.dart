import 'dart:async';

import 'package:dio/dio.dart';

class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  Future<dynamic> get(String url) async {
    Response response = await Dio().get(url);
    return response;
  }

  Future<dynamic> post(String url, Map<String, dynamic> data) async {
    Response response = await Dio().post(url, data: data);
    return response;
  }
}