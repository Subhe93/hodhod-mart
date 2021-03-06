// To parse this JSON data, do
//
//     final wishListItem = wishListItemFromJson(jsonString);

import 'dart:convert';

List<WishListItem> wishListItemFromJson(String str) => List<WishListItem>.from(
    json.decode(str).map((x) => WishListItem.fromJson(x)));

String wishListItemToJson(List<WishListItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishListItem {
  WishListItem({
    this.id,
    this.subCatagoryId,
    this.providerId,
    this.name,
    this.brand,
    this.discount,
    this.discountDescription,
    this.offer,
    this.offerDescription,
    this.tags,
    this.shortDescription,
    this.description,
    this.status,
    this.imagePath,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.mainImage,
    this.userId,
    this.productId,
    this.quantity,
  });

  int id;
  int subCatagoryId;
  int providerId;
  String name;
  String brand;
  String discount;
  String discountDescription;
  String offer;
  String offerDescription;
  String tags;
  String shortDescription;
  String description;
  String status;
  String imagePath;
  int price;
  DateTime createdAt;
  DateTime updatedAt;
  String mainImage;
  int userId;
  int productId;
  int quantity;

  factory WishListItem.fromJson(Map<String, dynamic> json) => WishListItem(
        id: json["id"],
        subCatagoryId: json["sub_catagory_id"],
        providerId: json["provider_id"],
        name: json["name"],
        brand: json["brand"],
        discount: json["discount"],
        discountDescription: json["discount_description"],
        offer: json["offer"],
        offerDescription: json["offer_description"],
        tags: json["tags"],
        shortDescription: json["short_description"],
        description: json["description"],
        status: json["status"],
        imagePath: json["image_path"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        mainImage: json["main_image"],
        userId: json["user_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sub_catagory_id": subCatagoryId,
        "provider_id": providerId,
        "name": name,
        "brand": brand,
        "discount": discount,
        "discount_description": discountDescription,
        "offer": offer,
        "offer_description": offerDescription,
        "tags": tags,
        "short_description": shortDescription,
        "description": description,
        "status": status,
        "image_path": imagePath,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "main_image": mainImage,
        "user_id": userId,
        "product_id": productId,
        "quantity": quantity,
      };
}
