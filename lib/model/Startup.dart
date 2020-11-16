import 'dart:convert';

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

List<MainCategory> mainCategoryFromJson(String str) => List<MainCategory>.from(
    json.decode(str).map((x) => MainCategory.fromJson(x)));

String mainCategoryToJson(List<MainCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdBanner {
  AdBanner({
    this.id,
    this.title,
    this.subtitle,
    this.buttonText,
    this.buttonLink,
    this.status,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String subtitle;
  String buttonText;
  String buttonLink;
  String status;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory AdBanner.fromJson(Map<String, dynamic> json) => AdBanner(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        buttonText: json["button_text"],
        buttonLink: json["button_link"],
        status: json["status"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "button_text": buttonText,
        "button_link": buttonLink,
        "status": status,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class MainCategory {
  MainCategory({
    this.id,
    this.name,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
