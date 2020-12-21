import 'dart:convert';

import 'package:hodhod_mart/model/Address.dart';

AddressResponse addressFromJson(String str) =>
    AddressResponse.fromJson(json.decode(str));

String addressToJson(AddressResponse data) => json.encode(data.toJson());

class AddressResponse {
  AddressResponse({
    this.addresses,
  });

  List<Address> addresses;

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      AddressResponse(
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
      };
}
