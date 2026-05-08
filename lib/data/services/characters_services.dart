// ignore_for_file: avoid_print

import 'package:bloc_test/consts/strings.dart';
import 'package:dio/dio.dart';

class CharactersServices {
  late Dio dio;

  CharactersServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 10),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get(charactersEndpoint);
      print(response.data.toString());
      final data = response.data['results'];
      return data;
    } catch (e) {
      print("Error : $e");
      return [];
    }
  }
}
