import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:jwt_decode/jwt_decode.dart';

import 'package:duwin/constants/network_constants.dart';

class Auth {
  static Auth? _instance;

  Auth._()
      : oauth = AadOAuth(OAUTH_CONFIG),
        storage = const FlutterSecureStorage();

  factory Auth() => _instance ??= Auth._();

  final AadOAuth oauth;

  final FlutterSecureStorage storage;

  String? _msToken;

  Future<String?> get msToken async {
    if (_msToken == null) {
      await oauth.login();
      _msToken =
          await oauth.getAccessToken() ?? (throw Exception('MS Token null'));
    }
    return _msToken;
  }

  String? _accessToken;

  Future<String?> get accessToken async {
    if ((_accessToken ??= await storage.read(key: 'accessToken')) == null ||
        Jwt.isExpired(_accessToken as String)) {
      String? msToken = await this.msToken;
      Uri url = Uri.parse(DUWIN_LOGIN);
      final res = await http.post(url, body: {'token': msToken});

      switch (res.statusCode) {
        case 200:
          _accessToken = jsonDecode(res.body)?['access'] ??
              (throw Exception('No access in response body'));
          storage.write(key: 'accessToken', value: _accessToken);
          break;
        default:
          throw Exception('Failed to load access token');
      }
    }
    return _accessToken;
  }

  int? _userId;

  Future<int?> get userId async {
    if (_userId == null) {
      String accessToken = (await this.accessToken) ?? '';
      Map<String, dynamic> payload = Jwt.parseJwt(accessToken);
      _userId = payload['user_id'];
    }

    return _userId;
  }

  Future<Auth> signIn() async {
    await accessToken;
    return this;
  }
}
