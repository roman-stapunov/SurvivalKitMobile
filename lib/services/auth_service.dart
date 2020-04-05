import 'package:http/http.dart';
import 'package:survival_kit/entities/user.dart';
import 'dart:convert';

class AuthService {
  static Future<bool> login(String login, String password) async {
    return Future.delayed(Duration(seconds: 2), () {
      if (login == 'admin' && password == '1111') {
        return true;
      }
      return false;
    });
  }

  static Future<Response> registrate(User user) async { 
      Map<String, String> headers = {'Content-Type': 'application/json'};

      String s = JsonEncoder().convert(user.toJson());
      return post('http://survivalkitnet.goldaim.ru/User', body: s, headers: headers);
  }
}
