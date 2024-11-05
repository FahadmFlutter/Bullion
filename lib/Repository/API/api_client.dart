// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_exception.dart';

class ApiClient {
  Future<Response> invokeAPI(String path, String method, Object? body) async {
    Map<String, String> headerParams = {
      'Content-Type': 'application/json', // This ensures you're sending JSON
    };
    Response response;

    String url = path;
    if (kDebugMode) {
      print(url);
    }

    // Obtain shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Token");

    // Add Authorization header if token is available
    if (token != null && token.isNotEmpty) {
      headerParams['Authorization'] = 'Bearer $token';
    }

    if (kDebugMode) {
      print(body);
    }

    switch (method) {
      case "POST":
        response = await post(
          Uri.parse(url),
          headers: headerParams,
          body: body,
        );
        break;

      case "PUT":
        response = await put(
          Uri.parse(url),
          headers: headerParams,
          body: body,
        );
        break;

      case "DELETE":
        response = await delete(
          Uri.parse(url),
          headers: headerParams,
          body: body,
        );
        break;

      case "PATCH":
        response = await patch(
          Uri.parse(url),
          headers: headerParams,
          body: body,
        );
        break;

      case "GET":
        response = await get(
          Uri.parse(url),
          headers: headerParams,
        );
        break;

      default:
        response = await get(Uri.parse(url), headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    }

    if (kDebugMode) {
      print('status of $path => ${response.statusCode}');
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
