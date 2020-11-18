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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        apiToken: json["api_token"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        role: json["role"] == null ? null : json["role"],
        image: json["image"],
        emailVerifiedAt: json["email_verified_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"] == null
            ? null
            : json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "last_name": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "api_token": apiToken,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "role": role == null ? null : role,
        "image": image,
        "email_verified_at": emailVerifiedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "profile_photo_url": profilePhotoUrl == null ? null : profilePhotoUrl,
      };
}
