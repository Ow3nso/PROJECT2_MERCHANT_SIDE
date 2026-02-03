import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Response, get, post, put, Helpers;

class ExternalRequestService {
  static Future<Map<String, dynamic>?> makeRequest(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, String>? headers,
      bool encode = false,
      String request = 'post'}) async {
    try {
      if (kDebugMode) {
        log('''
          Sending request to -> $url,
          Body -> $body,
          headers -> $headers,
          request -> $request\n
           ''');
      }

      late Response response;
      var uri = Uri.parse(url);
      if (request == 'post') {
        response = await post(uri,
            body: encode ? json.encode(body) : body, headers: headers);
      } else if (request == 'put') {
        response = await put(uri, body: body);
      } else {
        uri.replace(queryParameters: body);
        response = await get(uri);
      }

      if (kDebugMode) {
        log('''
            Response:

            request -> ${response.request?.url},
            status -> ${response.statusCode},
            body -> ${response.body}
            ''');
      }

      return jsonDecode(response.body);
    } catch (e) {
      if (kDebugMode) {
        Helpers.debugLog('Error -> $e');
      }
      rethrow;
    }
  }
}
