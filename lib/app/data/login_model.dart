import 'package:b2b/app/data/base_response_medel.dart';

class LoginRequestModel {
  String email = "";
  String password = "";
  String? dealerCode;

  LoginRequestModel({
    required this.email,
    required this.password,
    this.dealerCode,
  });

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    dealerCode = json['dealer_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['dealer_code'] = this.dealerCode;
    return data;
  }
}

class LoginResponseModel extends BaseResponseModel {
  int statusCode = 0;
  String? code = "";
  String? message;
  TokenResponse? data;

  LoginResponseModel({
    required this.statusCode,
    this.code,
    this.message,
    this.data,
  }) : super(
          statusCode: statusCode,
          code: code,
          message: message,
        );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      statusCode: json['status_code'],
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? TokenResponse.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TokenResponse {
  String? accessToken;
  String? refreshToken;

  TokenResponse({this.accessToken, this.refreshToken});

  TokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
