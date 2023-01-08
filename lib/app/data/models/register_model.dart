// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
    RegisterRequest({
        required this.email,
        required this.password,
        required this.dealerCode,
    });

    String email;
    String password;
    String dealerCode;

    factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
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
