import 'dart:convert';

import 'package:bullion/Repository/Models/register_model.dart';
import 'package:http/http.dart';

import 'api_client.dart';

class RegisterApi {
  ApiClient apiClient = ApiClient();

  Future<RegisterModel> getRegister({
    required String email,
    required String passWord,
  }) async {
    String path = 'http://178.18.254.224:3210/api/v1/auth/register';
    var body = {
      "Email": email,
      "Password": passWord,
    };
    Response response =
        await apiClient.invokeAPI(path, 'POST', jsonEncode(body));
    return RegisterModel.fromJson(jsonDecode(response.body));
  }
}
