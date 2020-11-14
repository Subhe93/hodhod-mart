import 'dart:convert';

WishListModel wishListFromJson(String str) =>
    WishListModel.fromJson(json.decode(str));

String wishListToJson(WishListModel data) => json.encode(data.toJson());

class WishListModel {
  WishListModel({
    this.wishListItem,
  });

  List<WishListItem> wishListItem;

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        wishListItem: List<WishListItem>.from(
            json["wishList"].map((x) => WishListItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "wishList": List<dynamic>.from(wishListItem.map((x) => x.toJson())),
      };
}

class WishListItem {
  WishListItem({this.id, this.imageUrl, this.title, this.price});

  int id;
  String imageUrl;
  String title;
  double price;

  factory WishListItem.fromJson(Map<String, dynamic> json) => WishListItem(
        id: json["id"],
        imageUrl: json["image_url"],
        price: json["price"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "title": title,
        "price": price,
      };
}

List<WishListItem> wishList = [
  WishListItem(
      id: 1,
      title: "and then use overflow and maxlines and then use overflow.",
      price: 250.0,
      imageUrl: "assets/toy1.jpeg"),
];
