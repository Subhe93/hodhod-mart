import 'package:hodhod_mart/model/MainCategory.dart';
import 'package:hodhod_mart/model/SubCategory.dart';

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
      print(e);
      return [];
    }
  }

  static Future<List<AdBanner>> getBanners() async {
    // Dio dio = new Dio();
    try {
      var response = await http.get(baseUrl + "banners");
      print(response);
      if (response.statusCode == 200) {
        List<AdBanner> banners = adBannerFromJson(response.body);
        return banners;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<MainCategory>> getCategories() async {
    //Dio dio = new Dio();
    try {
      final response = await http.get(baseUrl + "categories");
      print(response);
      if (response.statusCode == 200) {
        return mainCategoryFromJson(response.body);
      } else {
        throw Exception('Error' + response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<List<SubCategory>> getSubCategoriesById(int id) async {
    print(id);
    try {
      var response = await http.get(baseUrl + "getCategorySubs/$id");
      if (response.statusCode == 200) {
        List<SubCategory> categories = subCategoryFromJson(response.body);
        return categories;
      } else {
        throw Exception('error');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<Product>> getSubCategoryProducts(int id) async {
    try {
      var response = await http.get(baseUrl + "getSubCategoryProducts/$id");

      var subCategoryProductsObject =
          subCategoryProductsFromJson(response.body);
      return subCategoryProductsObject.products;
    } catch (e) {
      return [];
    }
  }
}
