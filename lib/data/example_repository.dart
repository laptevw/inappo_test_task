import 'package:dio/dio.dart';

class ExampleRepository {

  Dio _dio;

  ExampleRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: '/'
      )
    );
  }

}