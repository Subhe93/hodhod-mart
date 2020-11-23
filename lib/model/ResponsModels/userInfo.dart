import 'dart:convert';

import '../Address.dart';
import '../User.dart';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.user,
    this.addresses,
  });

  User user;
  List<Address> addresses;

  UserInfo copyWith({
    User user,
    List<Address> addresses,
  }) =>
      UserInfo(
        user: user ?? this.user,
        addresses: addresses ?? this.addresses,
      );

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        user: User.fromJson(json["user"]),
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
      };
}
