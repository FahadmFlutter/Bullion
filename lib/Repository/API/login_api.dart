import 'dart:convert';

import 'package:bullion/Repository/Models/login_model.dart';
import 'package:http/http.dart';

import 'api_client.dart';

class LoginApi{
  ApiClient apiClient =ApiClient();
  Future<LoginModel>getLogIn({required String email,required String passWord, })async{
    String path ='http://178.18.254.224:3210/api/v1/auth/login';
    var body ={
      "email": email,
      "password": passWord,
    };
    Response response = await apiClient.invokeAPI(path, 'POST', jsonEncode(body));
    return LoginModel.fromJson(jsonDecode(response.body));
  }
}