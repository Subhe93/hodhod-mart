// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.apiToken,
    this.phoneNumber,
    this.role,
    this.image,
    this.emailVerifiedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
  });

  int id;
  String name;
  String lastName;
  String email;
  dynamic apiToken;
  String phoneNumber;
  String role;
  dynamic image;
  dynamic emailVerifiedAt;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  DateTime createdAt;
  DateTime updatedAt;
  String profilePhotoUrl;

  User copyWith({
    int id,
    String name,
    String lastName,
    String email,
    dynamic apiToken,
    String phoneNumber,
    String role,
    dynamic image,
    dynamic emailVerifiedAt,
    dynamic currentTeamId,
    dynamic profilePhotoPath,
    DateTime createdAt,
    DateTime updatedAt,
    String profilePhotoUrl,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        apiToken: apiToken ?? this.apiToken,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        role: role ?? this.role,
        image: image ?? this.image,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        currentTeamId: currentTeamId ?? this.currentTeamId,
        profilePhotoPath: profilePhotoPath ?? this.profilePhotoPath,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        email: json["email"],
        apiToken: json["api_token"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        image: json["image"],
        emailVerifiedAt: json["email_verified_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "email": email,
        "api_token": apiToken,
        "phone_number": phoneNumber,
        "role": role,
        "image": image,
        "email_verified_at": emailVerifiedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "profile_photo_url": profilePhotoUrl,
      };
}
