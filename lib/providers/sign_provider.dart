// making provider for signup

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_provider.dart';

class SignProvider extends ChangeNotifier {
  String? username; // to check if the user is loged in or not

  // make the function future to await it & convert itstype to give reponse
  Future<bool> sign(
      {required String username, required String password}) async {
    try {
      print("helllo hello ");
      // check for errors
      var response = await MainProvider.dioClient.post("/register/", //
          data: {
            "username": username,
            "password": password,
          }); //dio client

      print('==========================');
      print(response);
      print('==========================');
      var token =
          response.data["token"]; // the other name for the token is access

      MainProvider.dioClient.options.headers["authorization"] =
          "Bearer $token"; // setting the header for the token

      this.username = username;

      var preferences = await SharedPreferences.getInstance();
      await preferences.setString("token", token); // saving the token

      return true; // when the user sign successflly
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
    return false; // when the user can't sign
  }

  Future<bool> tokena() async {
    // check if the token exist, expired
    var preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("tonken");

    if (token != null && JwtDecoder.isExpired(token)) {
      var tokenMap = JwtDecoder.decode(token); // converting the token to map
      username = tokenMap["username"];

      return true;
    }

    return false;
  }
}
