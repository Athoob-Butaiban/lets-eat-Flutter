import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

//making the dio clien
class MainProvider extends ChangeNotifier {
  static final Dio dioClient = Dio(
    BaseOptions(baseUrl: "http://10.0.0.2:8000"), // need the API link to it
  );
}
