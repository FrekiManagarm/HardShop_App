// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
    Register({
        this.user,
        this.token,
    });

    User? user;
    String? token;

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
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

