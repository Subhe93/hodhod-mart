// To parse this JSON data, do
//
//     final productDetails = productDetailsFromMap(jsonString);

import 'dart:convert';

class ProductDetails {
  ProductDetails({
    this.id,
    this.subCatagoryId,
    this.provider,
    this.name,
    this.brand,
    this.discount,
    this.discountDescription,
    this.offer,
    this.offerDescription,
    this.tags,
    this.shortDescription,
    this.description,
    this.price,
    this.images,
    this.attributes,
  });

  int id;
  int subCatagoryId;
  ElementProvider provider;
  String name;
  String brand;
  String discount;
  String discountDescription;
  String offer;
  String offerDescription;
  String tags;
  String shortDescription;
  String description;
  int price;
  List<String> images;
  Map<String, List<Attribute>> attributes;

  ProductDetails copyWith({
    int id,
    int subCatagoryId,
    ElementProvider provider,
    String name,
    String brand,
    String discount,
    String discountDescription,
    String offer,
    String offerDescription,
    String tags,
    String shortDescription,
    String description,
    int price,
    List<String> images,
    Map<String, List<Attribute>> attributes,
  }) =>
      ProductDetails(
        id: id ?? this.id,
        subCatagoryId: subCatagoryId ?? this.subCatagoryId,
        provider: provider ?? this.provider,
        name: name ?? this.name,
        brand: brand ?? this.brand,
        discount: discount ?? this.discount,
        discountDescription: discountDescription ?? this.discountDescription,
        offer: offer ?? this.offer,
        offerDescription: offerDescription ?? this.offerDescription,
        tags: tags ?? this.tags,
        shortDescription: shortDescription ?? this.shortDescription,
        description: description ?? this.description,
        price: price ?? this.price,
        images: images ?? this.images,
        attributes: attributes ?? this.attributes,
      );

  factory ProductDetails.fromJson(String str) =>
      ProductDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductDetails.fromMap(Map<String, dynamic> json) => ProductDetails(
        id: json["id"] == null ? null : json["id"],
        subCatagoryId:
            json["sub_catagory_id"] == null ? null : json["sub_catagory_id"],
        provider: json["provider"] == null
            ? null
            : ElementProvider.fromMap(json["provider"]),
        name: json["name"] == null ? null : json["name"],
        brand: json["brand"] == null ? null : json["brand"],
        discount: json["discount"] == null ? null : json["discount"],
        discountDescription: json["discount_description"] == null
            ? null
            : json["discount_description"],
        offer: json["offer"] == null ? null : json["offer"],
        offerDescription: json["offer_description"] == null
            ? null
            : json["offer_description"],
        tags: json["tags"] == null ? null : json["tags"],
        shortDescription: json["short_description"] == null
            ? null
            : json["short_description"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        attributes: json["attributes"] == null
            ? null
            : Map.from(json["attributes"]).map((k, v) =>
                MapEntry<String, List<Attribute>>(k,
                    List<Attribute>.from(v.map((x) => Attribute.fromMap(x))))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "sub_catagory_id": subCatagoryId == null ? null : subCatagoryId,
        "provider": provider == null ? null : provider.toMap(),
        "name": name == null ? null : name,
        "brand": brand == null ? null : brand,
        "discount": discount == null ? null : discount,
        "discount_description":
            discountDescription == null ? null : discountDescription,
        "offer": offer == null ? null : offer,
        "offer_description": offerDescription == null ? null : offerDescription,
        "tags": tags == null ? null : tags,
        "short_description": shortDescription == null ? null : shortDescription,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "images":
            images == null ? null : List<dynamic>.from(images.map((x) => x)),
        "attributes": attributes == null
            ? null
            : Map.from(attributes).map((k, v) => MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toMap())))),
      };
}

class Attribute {
  Attribute(
      {this.id,
      this.attributeId,
      this.productId,
      this.value,
      this.image,
      this.attributeValueKey,
      this.createdAt,
      this.updatedAt,
      this.selected = false});

  int id;
  int attributeId;
  int productId;
  String value;
  String image;
  String attributeValueKey;
  DateTime createdAt;
  DateTime updatedAt;
  bool selected;

  Attribute copyWith({
    int id,
    int attributeId,
    int productId,
    String value,
    String image,
    String attributeValueKey,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Attribute(
        id: id ?? this.id,
        attributeId: attributeId ?? this.attributeId,
        productId: productId ?? this.productId,
        value: value ?? this.value,
        image: image ?? this.image,
        attributeValueKey: attributeValueKey ?? this.attributeValueKey,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Attribute.fromJson(String str) => Attribute.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attribute.fromMap(Map<String, dynamic> json) => Attribute(
        id: json["id"] == null ? null : json["id"],
        attributeId: json["attribute_id"] == null ? null : json["attribute_id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        value: json["value"] == null ? null : json["value"],
        image: json["image"] == null ? null : json["image"],
        attributeValueKey: json["attribute_value_key"] == null
            ? null
            : json["attribute_value_key"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "attribute_id": attributeId == null ? null : attributeId,
        "product_id": productId == null ? null : productId,
        "value": value == null ? null : value,
        "image": image == null ? null : image,
        "attribute_value_key":
            attributeValueKey == null ? null : attributeValueKey,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class ElementProvider {
  ElementProvider({
    this.id,
    this.userId,
    this.companyName,
    this.city,
    this.fax,
    this.address,
    this.licenceNumber,
    this.commision,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String companyName;
  String city;
  String fax;
  String address;
  String licenceNumber;
  int commision;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  ElementProvider copyWith({
    int id,
    int userId,
    String companyName,
    String city,
    String fax,
    String address,
    String licenceNumber,
    int commision,
    String status,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      ElementProvider(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        companyName: companyName ?? this.companyName,
        city: city ?? this.city,
        fax: fax ?? this.fax,
        address: address ?? this.address,
        licenceNumber: licenceNumber ?? this.licenceNumber,
        commision: commision ?? this.commision,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ElementProvider.fromJson(String str) =>
      ElementProvider.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ElementProvider.fromMap(Map<String, dynamic> json) => ElementProvider(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        city: json["city"] == null ? null : json["city"],
        fax: json["fax"] == null ? null : json["fax"],
        address: json["address"] == null ? null : json["address"],
        licenceNumber:
            json["licence_number"] == null ? null : json["licence_number"],
        commision: json["commision"] == null ? null : json["commision"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "company_name": companyName == null ? null : companyName,
        "city": city == null ? null : city,
        "fax": fax == null ? null : fax,
        "address": address == null ? null : address,
        "licence_number": licenceNumber == null ? null : licenceNumber,
        "commision": commision == null ? null : commision,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
