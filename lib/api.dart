import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import "dart:io";
import 'package:logger/logger.dart';

final logger = Logger();

class Api {
  static String jwt = '';
  static String platform = '';
  static String version = '';
  static String buildNumber = '';

  static Future<String?> getJwt() async {
    if (jwt.isEmpty) {
      final prefs = await SharedPreferences.getInstance();
      jwt = prefs.getString("jwt") ?? '';
    }
    return jwt;
  }

  static Future<Map<String, String>> getHeaders(
      {Map<String, String>? customHeaders}) async {
    String? jwt = await getJwt();
    if (version.isEmpty) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    }
    platform = Platform.operatingSystem;
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
      String utf8Body = utf8.decode(response.bodyBytes);
      return json.decode(utf8Body);
    } else {
      throw Exception('Failed to load data because: ${response.body}');
    }
  }

  static Future<dynamic> get(String url,
      {Map<String, String>? headers, bool debug = false}) async {
    var reqHeaders = await getHeaders(customHeaders: headers);
    if (debug) {
      logger.d('Request headers: $reqHeaders');
    }
    var response = await http.get(Uri.parse(url), headers: reqHeaders);
    return handleResponse(response);
  }

  static Future<dynamic> post(String url, dynamic body,
      {Map<String, String>? headers, bool debug = false}) async {
    var reqHeaders = await getHeaders(customHeaders: headers);
    if (debug) {
      logger.d('Request headers: $reqHeaders');
    }
    var response = await http.post(Uri.parse(url),
        headers: reqHeaders, body: json.encode(body));
    return handleResponse(response);
  }
}
