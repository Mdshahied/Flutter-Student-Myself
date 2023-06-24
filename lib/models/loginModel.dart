// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.flag,
    this.status,
  });

  String? flag;
  String? status;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        flag: json["Flag"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Flag": flag,
        "Status": status,
      };
}
