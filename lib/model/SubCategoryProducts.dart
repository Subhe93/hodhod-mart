import 'dart:convert';

SubCategoryProducts subCategoryProductsFromJson(String str) =>
    SubCategoryProducts.fromJson(json.decode(str));

String subCategoryProductsToJson(SubCategoryProducts data) =>
    json.encode(data.toJson());

class SubCategoryProducts {
  SubCategoryProducts({
    this.products,
  });

  List<Product> products;

  factory SubCategoryProducts.fromJson(Map<String, dynamic> json) =>
      SubCategoryProducts(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
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

  Product copyWith({
    int id,
    int subCatagoryId,
    int providerId,
    String name,
    String brand,
    String discount,
    String discountDescription,
    String offer,
    String offerDescription,
    String tags,
    String shortDescription,
    String description,
    String status,
    String imagePath,
    int price,
    DateTime createdAt,
    DateTime updatedAt,
    String mainImage,
  }) =>
      Product(
        id: id ?? this.id,
        subCatagoryId: subCatagoryId ?? this.subCatagoryId,
        providerId: providerId ?? this.providerId,
        name: name ?? this.name,
        brand: brand ?? this.brand,
        discount: discount ?? this.discount,
        discountDescription: discountDescription ?? this.discountDescription,
        offer: offer ?? this.offer,
        offerDescription: offerDescription ?? this.offerDescription,
        tags: tags ?? this.tags,
        shortDescription: shortDescription ?? this.shortDescription,
        description: description ?? this.description,
        status: status ?? this.status,
        imagePath: imagePath ?? this.imagePath,
        price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        mainImage: mainImage ?? this.mainImage,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
      };
}
