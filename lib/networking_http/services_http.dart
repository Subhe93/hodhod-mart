import 'package:flutter/material.dart';
import 'package:hodhod_mart/Manager/Manage.dart';
import 'package:hodhod_mart/model/MainCategory.dart';
import 'package:hodhod_mart/model/ResponsModels/loginResponse.dart';
import 'package:hodhod_mart/model/ResponsModels/Startup.dart';
import 'package:hodhod_mart/model/SubCategory.dart';
import 'package:hodhod_mart/model/User.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:provider/provider.dart';

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

  // static Future<List<AdBanner>> getBanners() async {
  //   // Dio dio = new Dio();
  //   try {
  //     var response = await http.get(baseUrl + "banners");
  //     print(response);
  //     if (response.statusCode == 200) {
  //       List<AdBanner> banners = adBannerFromJson(response.body);
  //       return banners;
  //     } else {
  //       throw Exception('Error');
  //     }
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  static Future<List<MainCategory>> getCategories() async {
    //Dio dio = new Dio();
    try {
      print(Manager.token);
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

  static Future<Startup> getStartup() async {
    try {
      final response = await http.get(baseUrl + "bannersAndCategories");
      print(response);
      if (response.statusCode == 200) {
        return startupFromJson(response.body);
      } else {
        throw Exception('Error' + response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
      return Startup();
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

  ///Register Services:
  ///
  ///login
  static Future<LoginResponse> login(
      String password, String email, BuildContext context) async {
    try {
      var response = await http.post(baseUrl + "auth/login",
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        var result = LoginResponse.fromJson(convert.jsonDecode(response.body));
        Manager.setAuthToken(result.accessToken, context);
        return result;
      } else {
        return LoginResponse(accessToken: '');
      }
    } catch (e) {
      print(e);
      return LoginResponse(accessToken: '');
    }
  }

  static Future<int> createAccount(
      String password,
      String email,
      String firstName,
      String lastName,
      String phone,
      BuildContext context) async {
    try {
      var response = await http.post(baseUrl + "auth/signup", body: {
        "email": email,
        "password": password,
        "name": firstName,
        "last_name": lastName,
        "password_confirmation": password,
        "phone_number": phone,
        "role": "User",
      });

      switch (response.statusCode) {
        case 201:
          {
            var result =
                LoginResponse.fromJson(convert.jsonDecode(response.body));
            Manager.setAuthToken(result.accessToken, context);
            return 200;
          }
        case 422:
          {
            Manager.toastMessage('Email or Phone Already Taken', Colors.red);
            return 422;
          }
        default:
          {
            Manager.toastMessage('Something Went Wrong', Colors.red);
            return 500;
          }
      }
    } catch (e) {
      print(e);
      return 0;
    }
  }

  ///User info;
  static Future<User> GetUserInfo(BuildContext context) async {
    User result;
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});

      var response = await http.get(baseUrl + "auth/user", headers: {
        'Authentication': 'Bearer ' + token,
        'Content-Type': 'application/json'
      });

      if (response.statusCode == 200) {
        print(response.body);
        //  result = User.fromJson(convert.jsonDecode(response.body));
        return User();
        // Provider.of<ModelsProvider>(context, listen: false).setUser(result);
        return result;
      } else {
        return User();
      }
    } catch (e) {
      print(e);
      return User();
    }
  }
}
