// To parse this JSON data, do
//
//     final boitier = boitierFromJson(jsonString);

import 'dart:convert';

Boitier boitierFromJson(String str) => Boitier.fromJson(json.decode(str));

String boitierToJson(Boitier data) => json.encode(data.toJson());

class Boitier {
    Boitier({
        this.user,
        this.token,
    });

    User? user;
    String? token;

    factory Boitier.fromJson(Map<String, dynamic> json) => Boitier(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
    };
}

class User {
    User({
        this.id,
        this.firstname,
        this.lastname,
        this.email,
        this.isAdmin,
        this.avatarUrl,
    });

    int? id;
    String? firstname;
    String? lastname;
    String? email;
    int? isAdmin;
    String? avatarUrl;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        isAdmin: json["is_Admin"],
        avatarUrl: json["avatar_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "is_Admin": isAdmin,
        "avatar_url": avatarUrl,
    };
}
