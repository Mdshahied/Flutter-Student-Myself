// To parse this JSON data, do
//
//     final registrationmodel = registrationmodelFromJson(jsonString);

import 'dart:convert';

Registrationmodel registrationmodelFromJson(String str) =>
    Registrationmodel.fromJson(json.decode(str));

String registrationmodelToJson(Registrationmodel data) =>
    json.encode(data.toJson());

class Registrationmodel {
  Registrationmodel({
    this.flag,
    this.status,
  });

  String? flag;
  String? status;

  factory Registrationmodel.fromJson(Map<String, dynamic> json) =>
      Registrationmodel(
        flag: json["Flag"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Flag": flag,
        "Status": status,
      };
}
