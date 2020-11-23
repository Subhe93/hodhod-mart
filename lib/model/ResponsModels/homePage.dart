import 'dart:convert';

import 'package:hodhod_mart/model/AdBanners.dart';
import 'package:hodhod_mart/model/MainCategory.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';

HomeInfo homeInfoFromJson(String str) => HomeInfo.fromJson(json.decode(str));

String homeInfoToJson(HomeInfo data) => json.encode(data.toJson());

class HomeInfo {
  HomeInfo({
    this.banners,
    this.categories,
    this.categoriesToShow,
    this.productsToShow,
  });

  List<AdBanner> banners;
  List<MainCategory> categories;
  List<MainCategory> categoriesToShow;
  List<List<Product>> productsToShow;

  HomeInfo copyWith({
    List<AdBanner> banners,
    List<MainCategory> categories,
    List<MainCategory> categoriesToShow,
    List<List<Product>> productsToShow,
  }) =>
      HomeInfo(
        banners: banners ?? this.banners,
        categories: categories ?? this.categories,
        categoriesToShow: categoriesToShow ?? this.categoriesToShow,
        productsToShow: productsToShow ?? this.productsToShow,
      );

  factory HomeInfo.fromJson(Map<String, dynamic> json) => HomeInfo(
        banners: List<AdBanner>.from(
            json["banners"].map((x) => AdBanner.fromJson(x))),
        categories: List<MainCategory>.from(
            json["categories"].map((x) => MainCategory.fromJson(x))),
        categoriesToShow: List<MainCategory>.from(
            json["categories_to_show"].map((x) => MainCategory.fromJson(x))),
        productsToShow: List<List<Product>>.from(json["products_to_show"]
            .map((x) => List<Product>.from(x.map((x) => Product.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "categories_to_show":
            List<dynamic>.from(categoriesToShow.map((x) => x.toJson())),
        "products_to_show": List<dynamic>.from(productsToShow
            .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}
