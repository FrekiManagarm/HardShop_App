// To parse this JSON data, do
//
//     final boitier = boitierFromJson(jsonString);

import 'dart:convert';

Boitier boitierFromJson(String str) => Boitier.fromJson(json.decode(str));

String boitierToJson(Boitier data) => json.encode(data.toJson());

class Boitier {
    Boitier({
        required this.user,
    });

    User user;

    factory Boitier.fromJson(Map<String, dynamic> json) => Boitier(
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
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
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int? id;
    String? firstname;
    String? lastname;
    String? email;
    int? isAdmin;
    String? avatarUrl;
    DateTime? emailVerifiedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? deletedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        isAdmin: json["is_Admin"],
        avatarUrl: json["avatar_url"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "is_Admin": isAdmin,
        "avatar_url": avatarUrl,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
