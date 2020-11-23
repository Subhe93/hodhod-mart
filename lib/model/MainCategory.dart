import 'dart:convert';

List<MainCategory> mainCategoryFromJson(String str) => List<MainCategory>.from(
    json.decode(str).map((x) => MainCategory.fromJson(x)));

String mainCategoryToJson(List<MainCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MainCategory {
  MainCategory({
    this.id,
    this.name,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.subCategories,
    this.catagoryId,
  });

  int id;
  String name;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<MainCategory> subCategories;
  int catagoryId;

  MainCategory copyWith({
    int id,
    String name,
    String image,
    String status,
    DateTime createdAt,
    DateTime updatedAt,
    List<MainCategory> subCategories,
    int catagoryId,
  }) =>
      MainCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        subCategories: subCategories ?? this.subCategories,
        catagoryId: catagoryId ?? this.catagoryId,
      );

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subCategories: json["sub__categories"] == null
            ? null
            : List<MainCategory>.from(
                json["sub__categories"].map((x) => MainCategory.fromJson(x))),
        catagoryId: json["catagory_id"] == null ? null : json["catagory_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sub__categories": subCategories == null
            ? null
            : List<dynamic>.from(subCategories.map((x) => x.toJson())),
        "catagory_id": catagoryId == null ? null : catagoryId,
      };
}
