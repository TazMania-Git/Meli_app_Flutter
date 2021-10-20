// To parse this JSON data, do
//
//     final token = tokenFromMap(jsonString);

import 'dart:convert';

class Token {
    Token({
       required this.accessToken,
       required this.tokenType,
       required this.expiresIn,
       required this.scope,
       required this.userId,
       required this.refreshToken,
    });

    String accessToken;
    String tokenType;
    int expiresIn;
    String scope;
    int userId;
    String refreshToken;

    factory Token.fromJson(String str) => Token.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Token.fromMap(Map<String, dynamic> json) => Token(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        scope: json["scope"],
        userId: json["user_id"],
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "scope": scope,
        "user_id": userId,
        "refresh_token": refreshToken,
    };
}
