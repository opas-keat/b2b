// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    required this.email,
    required this.password,
    required this.dealerCode,
  });

  String email;
  String password;
  String dealerCode;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json["email"],
        password: json["password"],
        dealerCode: json["dealer_code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "dealer_code": dealerCode,
      };
}

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.statusCode,
    required this.code,
    required this.message,
    required this.data,
  });

  int statusCode;
  String code;
  String message;
  Token data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        statusCode: json["status_code"],
        code: json["code"],
        message: json["message"],
        data: Token.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Token {
  Token({
    required this.accessToken,
    required this.refreshToken,
  });

  String accessToken;
  String refreshToken;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
