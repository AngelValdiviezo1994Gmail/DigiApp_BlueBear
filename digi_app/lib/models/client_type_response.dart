import 'dart:convert';
//import 'package:digi_app/models/index.dart';

class ClientTypeResponse {
    ClientTypeResponse({
      /*
      required this.succeeded,
      required this.message,
      required this.statusCode,
      required this.errors,
      required this.data,
      */
      required this.token,
      required this.mensaje,
    });
/*
    bool succeeded;
    String message;
    String statusCode;
    Errors errors;
    String data;
    */
    String token;
    String mensaje;

    factory ClientTypeResponse.fromJson(String str) => ClientTypeResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClientTypeResponse.fromMap(Map<String, dynamic> json) => ClientTypeResponse(
        token: json["token"] ?? '',
        mensaje: json["mensaje"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "mensaje": mensaje,
    };
}
