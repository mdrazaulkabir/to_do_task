import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'network_response.dart';

class NetworkCaller {
  static const String _defaultErrorMessage =
      "Api can't fetch the server and data";

  /// ====================== GET ======================
  static Future<NetworkResponse> get({
    required String url,
    bool isAuthorized = true,
  }) async {
    return _request(
      url: url,
      method: "GET",
      isAuthorized: isAuthorized,
    );
  }

  /// ====================== POST ======================
  static Future<NetworkResponse> post({
    required String url,
    dynamic body,
    bool isAuthorized = true,
  }) async {
    return _request(
      url: url,
      method: "POST",
      body: body,
      isAuthorized: isAuthorized,
    );
  }

  /// ====================== PUT ======================
  static Future<NetworkResponse> put({
    required String url,
    dynamic body,
    bool isAuthorized = true,
  }) async {
    return _request(
      url: url,
      method: "PUT",
      body: body,
      isAuthorized: isAuthorized,
    );
  }

  /// ====================== DELETE ======================
  static Future<NetworkResponse> delete({
    required String url,
    dynamic body,
    bool isAuthorized = true,
  }) async {
    return _request(
      url: url,
      method: "DELETE",
      body: body,
      isAuthorized: isAuthorized,
    );
  }

  /// ====================== COMMON REQUEST HANDLER ======================
  static Future<NetworkResponse> _request({
    required String url,
    required String method,
    dynamic body,
    bool isAuthorized = true,
  }) async {
    try {
      final uri = Uri.parse(url);

      final headers = {
        "content-type": "application/json",
        // if (isAuthorized && AuthController.userToken != null)
        //   "token": AuthController.userToken!,
      };

      _logRequest(url, headers, body);

      late http.Response response;

      switch (method) {
        case "POST":
          // response = await http.post(
          //   uri,
          //   headers: headers,
          //   body: jsonEncode(body),
          // );
          response = await http.post(
            uri,
            headers: headers,
            body: body is String ? body : jsonEncode(body),
          );
          break;

        case "PUT":
          response = await http.put(
            uri,
            headers: headers,
            body: jsonEncode(body),
          );
          break;

        case "DELETE":
          response = await http.delete(
            uri,
            headers: headers,
            body: jsonEncode(body),
          );
          break;

        default:
          response = await http.get(uri, headers: headers);
      }

      _logResponse(url, response);

      final decodedData = response.body.isNotEmpty ? jsonDecode(response.body) : null;

      /// SUCCESS
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          data: decodedData,
        );
      }

      /// UNAUTHORIZED
      // if (response.statusCode == 401) {
      //   await _unAuthorized();
      // }

      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        data: decodedData,
        errorMessage: decodedData?['message'] ?? _defaultErrorMessage,
      );
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  /// ====================== LOG ======================
  static void _logRequest(
      String uri, Map<String, dynamic>? headers, dynamic body) {
    debugPrint(
        "''''''''''''''''''''Request''''''''''''''''''''''''''\n"
            "uri: $uri\n"
            "headers: $headers\n"
            "body: $body\n"
            "'''''''''''''''''''''''''''''''''''''''''''''''''''''");
  }

  static void _logResponse(String uri, http.Response response) {
    debugPrint(
        "''''''''''''''''''Response''''''''''''''''''''''''''\n"
            "uri: $uri\n"
            "status code: ${response.statusCode}\n"
            "response: ${response.body}\n"
            "'''''''''''''''''''''''''''''''''''''''''''''''''''''''");
  }



  /// ====================== UNAUTHORIZED ======================
  // static Future<void> _unAuthorized() async {
  //   await AuthController.clearData();
  //   Navigator.of(NoteBookApp.navigator.currentContext!).pushNamedAndRemoveUntil(SignInScreen.name, (route) => false);
  // }
}