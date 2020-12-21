// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

import 'dart:ffi';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    this.cart,
    this.cartTotal,
  });

  List<CartItem> cart;
  dynamic cartTotal;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        cart:
            List<CartItem>.from(json["cart"].map((x) => CartItem.fromJson(x))),
        cartTotal: json["cart_total"],
      );

  Map<String, dynamic> toJson() => {
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
        "cart_total": cartTotal,
      };
}

class CartItem {
  CartItem({
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
    this.offerId,
    this.quantity,
    this.maxPrice,
    this.rating,
    this.userId,
    this.productId,
    this.options,
    this.totalPrice,
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
  int offerId;
  int quantity;
  int maxPrice;
  int rating;
  int userId;
  int productId;
  dynamic options;
  int totalPrice;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
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
        offerId: json["offer_id"],
        quantity: json["quantity"],
        maxPrice: json["max_price"],
        rating: json["rating"],
        userId: json["user_id"],
        productId: json["product_id"],
        options: json["options"],
        totalPrice: json["total_price"],
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
        "offer_id": offerId,
        "quantity": quantity,
        "max_price": maxPrice,
        "rating": rating,
        "user_id": userId,
        "product_id": productId,
        "options": options,
        "total_price": totalPrice,
      };
}
