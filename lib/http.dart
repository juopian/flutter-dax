import "dart:io";
import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class Api {
  static String jwt = '';
  static String platform = kIsWeb ? 'web' : Platform.operatingSystem;
  static String version = '';
  static String buildNumber = '';

  static Future<String?> getJwt() async {
    if (jwt.isEmpty) {
      var prefs = await SharedPreferences.getInstance();
      jwt = prefs.getString("jwt") ?? prefs.getString("idtoken") ?? '';
    }
    return jwt;
  }

  static Future<Map<String, String>> getHeaders(
      {Map<String, String>? customHeaders}) async {
    String? jwt = await getJwt();
    if (version.isEmpty) {
      var packageInfo = await PackageInfo.fromPlatform();
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    }
    Map<String, String> headers = {
      'Authorization': 'Bearer $jwt',
      'version-number': version,
      'build-number': buildNumber,
      'platform': platform
    };
    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }
    return headers;
  }

  static Future<dynamic> handleResponse(http.Response response) async {
    if (response.statusCode == 200) {
      if (response.headers['content-type'] == 'application/json') {
        String utf8Body = utf8.decode(response.bodyBytes);
        return json.decode(utf8Body);
      } else {
        return response.body;
      }
    } else {
      throw Exception('Failed to load data because: ${response.body}');
    }
  }

  static Future<dynamic> get(String url,
      {Map<String, String>? headers,
      bool debug = false,
      bool sendLastModified = false}) async {
    var reqHeaders = await getHeaders(customHeaders: headers);
    if (debug) {
      logger.d('Request headers: $reqHeaders');
    }
    var response = await http.get(Uri.parse(url), headers: reqHeaders);
    return handleResponse(response);
  }

  static Future<dynamic> post(String url,
      {dynamic body, Map<String, String>? headers, bool debug = false}) async {
    var reqHeaders = await getHeaders(customHeaders: headers);
    if (debug) {
      logger.d('Request headers: $reqHeaders');
    }
    var response =
        await http.post(Uri.parse(url), headers: reqHeaders, body: body);
    return handleResponse(response);
  }

  static Future<String> uploadFile(String url,
      {Map<String, String>? headers,
      String imagePath = '',
      String fieldName = ''}) async {
    var reqHeaders = await getHeaders(customHeaders: headers);

    var request = http.MultipartRequest("POST", Uri.parse(url));
    var pic = await http.MultipartFile.fromPath(fieldName, imagePath);
    request.files.add(pic);
    request.headers.addAll(reqHeaders);
    var response = await request.send();

    String responseString = await response.stream.bytesToString();
    return responseString;
  }
}
