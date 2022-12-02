import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

//making the dio clien
class MainProvider extends ChangeNotifier {
  static final Dio dioClient = Dio(
    BaseOptions(baseUrl: "http://127.0.0.1:8000"), // need the API link to it
  );
}
