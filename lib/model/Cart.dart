// To parse this JSON data, do
//
//     final cartItems = cartItemsFromJson(jsonString);

import 'dart:convert';

List<CartItem> cartItemsFromJson(String str) =>
    List<CartItem>.from(json.decode(str).map((x) => CartItem.fromJson(x)));

String cartItemsToJson(List<CartItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItem {
  CartItem({
    this.id,
    this.userId,
    this.productId,
    this.options,
    this.quantity,
    this.createdAt,
    this.updatedAt,
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
    this.mainImage,
  });

  int id;
  int userId;
  int productId;
  String options;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;
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
  String mainImage;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        options: json["options"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        mainImage: json["main_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "options": options,
        "quantity": quantity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
        "main_image": mainImage,
      };
}
