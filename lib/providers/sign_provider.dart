// making provider for signup

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:letseat/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignProvider extends ChangeNotifier {
  String? username; // to check if the user is loged in or not
  int? password;
  // make the function future to await it & convert itstype to give reponse
  Future<String?> signup(
      {required String username, required String password}) async {
    try {
      Client.dio.options.headers.remove("authorization");
      print("helllo hello this is signup");
      // check for errors
      var response = await Client.dio.post("/register/", //
          data: {
            "username": username,
            "password": password,
          }); //dio client

      print('==========================');
      print(response);
      print('==========================');
      var token =
          response.data["token"]; // the other name for the token is access

      Client.dio.options.headers["authorization"] =
          "Bearer $token"; // setting the header for the token

      this.username = username;

      var preferences = await SharedPreferences.getInstance();
      await preferences.setString("token", token); // saving the token

      return null; // when the user sign successflly
    } on DioError catch (e) {
      print(e);

      if (e.response != null) {
        var map = e.response!.data as Map;
        print(map.values.first);
        return map.values.first.first;
      }
    } catch (e) {
      print(e);
    }
    return "unknoen error"; // when the user can't sign
  }

  Future<String?> signin(
      {required String username, required String password}) async {
    try {
      print("HELLO HELLO this is sign in");
      // check for errors
      Client.dio.options.headers.remove("authorization");
      var response = await Client.dio.post("/login/", //this is the
          data: {
            "username": username,
            "password": password,
          }); //dio client

      print('******************');
      print(response);
      print('******************');
      var token =
          response.data["token"]; // the other name for the token is access

      Client.dio.options.headers["authorization"] =
          "Bearer $token"; // setting the header for the token

      this.username = username;

      var preferences = await SharedPreferences.getInstance();
      await preferences.setString("token", token); // saving the token

      return null; // when the user sign successflly
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
    return null; // when the user can't sign
  }

  Future<bool> hasToken() async {
    // check if the token exist, expired
    var preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");

    if (token != null && JwtDecoder.isExpired(token)) {
      var tokenMap = JwtDecoder.decode(token); // converting the token to map
      username = tokenMap["username"];

      return true;
    }

    return false;
  }

  void signout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("token");
    username = null; // no signin for the user
    Client.dio.options.headers.remove("authorization"); // removing the header
    notifyListeners();

    print("this is signout");
  }
}
