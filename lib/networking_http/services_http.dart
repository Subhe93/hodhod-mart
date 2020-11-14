import 'package:hodhod_mart/model/MainCategory.dart';
import 'package:hodhod_mart/model/SubCategory.dart';
import 'package:hodhod_mart/screens/homePage/components/category/categories.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:hodhod_mart/model/Banners.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';

class HttpServices {
  static const baseUrl = 'https://hodhodmart.hashtagweb.online/api/';

  static Future<List<Product>> getProducts(int subcatId) async {
    try {
      var response =
          await http.get(baseUrl + "getSubCategoryProducts/$subcatId");
      var items =
          SubCategoryProducts.fromJson(convert.jsonDecode(response.body));
      return items.products;
    } catch (e) {
      return [];
    }
  }

  static Future<List<AdBanner>> getBanners() async {
    try {
      var response = await http.get(baseUrl + "banners");
      print(response);
      var banners = adBannerFromJson(response.body);
      return banners;
    } catch (e) {
      return [];
    }
  }

  static Future<List<MainCategory>> getCategories() async {
    try {
      var response = await http.get(baseUrl + "categories");
      print(Categories());
      var categories = mainCategoryFromJson(response.body);
      return categories;
    } catch (e) {
      return [];
    }
  }

  static Future<List<SubCategory>> getSubCategoriesById(int id) async {
    try {
      var response = await http.get(baseUrl + "getCategorySubs/$id");
      print(Categories());
      var categories = subCategoryFromJson(response.body);
      return categories;
    } catch (e) {
      return [];
    }
  }

  static Future<List<Product>> getSubCategoryProducts(int id) async {
    try {
      var response = await http.get(baseUrl + "getSubCategoryProducts/$id");
      print(Categories());
      var subCategoryProductsObject =
          subCategoryProductsFromJson(response.body);
      return subCategoryProductsObject.products;
    } catch (e) {
      return [];
    }
  }
}
