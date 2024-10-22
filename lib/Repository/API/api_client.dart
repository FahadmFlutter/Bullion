// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_exception.dart';

class ApiClient {
  Future<Response> invokeAPI(String path, String method, Object? body) async {
    Map<String, String> headerParams = {};
    Response response;

    String url = path;
    if (kDebugMode) {
      print(url);
    }
// Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("Token").toString();
    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;
    if (kDebugMode) {
      print(body);
    }
    switch (method) {
      case "POST":
        response = await post(Uri.parse(url),
            headers: {"Authorization": 'Bearer $token'}, body: body);

        break;
      case "PUT":
        response = await put(Uri.parse(url),
            headers: {
              'content-Type': 'application/json',
            },
            body: body);
        break;
      case "DELETE":
        response = await delete(Uri.parse(url),
            headers: {"Authorization": 'Bearer $token'}, body: body);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {'content-Type': 'application/json'},
          body: body,
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      case "GET":
        response = await get(
          Uri.parse(url),
          headers: {"Authorization": 'Bearer $token'},
        );

        break;
      case "PATCH":
        response = await patch(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
        break;
      case "PATCH1":
        response = await patch(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      default:
        response = await get(Uri.parse(url), headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    }

    if (kDebugMode) {
      print('status of $path =>${response.statusCode}');
    }
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode >= 400) {
      log('$path : ${response.statusCode} : ${response.body}');

      throw ApiException(_decodeBodyBytes(response), response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}
