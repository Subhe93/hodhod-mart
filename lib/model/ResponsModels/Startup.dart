import 'dart:convert';

import 'package:hodhod_mart/model/MainCategory.dart';

import '../AdBanners.dart';

Startup startupFromJson(String str) => Startup.fromJson(json.decode(str));

String startupToJson(Startup data) => json.encode(data.toJson());

class Startup {
  Startup({
    this.banners,
    this.categories,
  });

  List<AdBanner> banners;
  List<MainCategory> categories;

  factory Startup.fromJson(Map<String, dynamic> json) => Startup(
        banners: List<AdBanner>.from(
            json["banners"].map((x) => AdBanner.fromJson(x))),
        categories: List<MainCategory>.from(
            json["categories"].map((x) => MainCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}
