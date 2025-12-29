import 'dart:convert';
import 'dart:io';

import 'package:db_proj/core/configs/api_configs.dart';
import 'package:db_proj/core/configs/shared_pref_configs.dart';
import 'package:db_proj/core/models/process_response.dart';
import 'package:db_proj/core/models/user.dart';
import 'package:db_proj/core/utils/helpers.dart';
import 'package:http/http.dart' as http;

class AuthApiController with Helpers {
  Future<ProcessResponse> register(User user) async{
    Uri uri = Uri.parse(ApiConfigs.register);
    var stringResponse = await http.post(uri, body: {
      "first_name": user.firstName,
      "email": user.email,
      "password": user.password,
    });

    if(stringResponse.statusCode == 201 || stringResponse.statusCode == 400) {
      var jsonResopnse = jsonDecode(stringResponse.body);
      return ProcessResponse(msg: jsonResopnse['message'], isSuccess: jsonResopnse['status']);
    }
    return failedResponse;
  }

  Future<ProcessResponse> login(User user) async{
    Uri uri = Uri.parse(ApiConfigs.login);
    var stringResponse = await http.post(uri, body: {
      "email": user.email,
      "password": user.password,
    });

    if(stringResponse.statusCode == 200 || stringResponse.statusCode == 400) {
      var jsonResopnse = jsonDecode(stringResponse.body);
      if(stringResponse.statusCode == 200){
        var jsonObj = jsonResopnse['data'];
        User user = User.from(jsonObj);
        SharedPrefConfigs().saveUser(user: user);
      }
      return ProcessResponse(msg: jsonResopnse['message'], isSuccess: jsonResopnse['status']);
    }
    return failedResponse;
  }

  Future<ProcessResponse> logout() async{
    Uri uri = Uri.parse(ApiConfigs.logout);
    var stringResponse = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: SharedPrefConfigs().getToken,
      HttpHeaders.acceptHeader: "application/json",
    });
    if(stringResponse.statusCode == 200 || stringResponse.statusCode == 401){
      await SharedPrefConfigs().logout();
      // if(stringResponse.statusCode == 200){
        var jsonResopnse = jsonDecode(stringResponse.body);
      //   return ProcessResponse(msg: jsonResopnse['message'], isSuccess: jsonResopnse['status']);
      // }
      // return ProcessResponse(msg: "logout successfully", isSuccess: true);
      return ProcessResponse(msg: stringResponse.statusCode == 200
      ? jsonResopnse['message']
      : "logout successfully",
          isSuccess: true);
    }
    return failedResponse;
  }


  Future<ProcessResponse> forgetPassword({required String email}) async {
    Uri uri = Uri.parse(ApiConfigs.forgetPassword);
    var stringResponse = await http.post(uri, body: {
      "email": email,
    });
    if(stringResponse.statusCode == 200 || stringResponse.statusCode == 400){
      var jsonResponse = jsonDecode(stringResponse.body);
      return ProcessResponse(msg: jsonResponse['message'], isSuccess: jsonResponse['status']);
    }
    return failedResponse;
  }


  Future<ProcessResponse> resetPassword({required String email, required String code, required String password}) async {
    Uri uri = Uri.parse(ApiConfigs.resetPassword);
    var stringResponse = await http.post(uri, body: {
      "email": email,
      "code": code,
      "password": password,
      // "password_confirmation": password,
    });
    if(stringResponse.statusCode == 200 || stringResponse.statusCode == 400){
      var jsonResponse = jsonDecode(stringResponse.body);
      return ProcessResponse(msg: jsonResponse['message'], isSuccess: jsonResponse['status']);
    }
    return failedResponse;
  }

}