import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hodhod_mart/Manager/Manage.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/Cart.dart';
import 'package:hodhod_mart/model/MainCategory.dart';
import 'package:hodhod_mart/model/Order.dart';
import 'package:hodhod_mart/model/ProductDetails.dart';
import 'package:hodhod_mart/model/ResponsModels/homePage.dart';
import 'package:hodhod_mart/model/ResponsModels/loginResponse.dart';
import 'package:hodhod_mart/model/ResponsModels/Startup.dart';
import 'package:hodhod_mart/model/ResponsModels/searchResponse.dart';
import 'package:hodhod_mart/model/ResponsModels/userInfo.dart';
import 'package:hodhod_mart/model/SubCategory.dart';
import 'package:hodhod_mart/model/User.dart';
import 'package:hodhod_mart/model/whoshlist_model.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:http_parser/http_parser.dart';

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

  ///
/////
/////
  ///
  ///
  ///
  ///
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

////Create Account
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
  ////////////
  /////////////
  /////////////
  ///////////
  static Future<UserInfo> GetUserInfo(BuildContext context) async {
    UserInfo result;
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});

      var response = await http.get(baseUrl + "auth/user", headers: {
        'Authorization': 'Bearer ' + token,
      });

      if (response.statusCode == 200) {
        result = UserInfo.fromJson(convert.jsonDecode(response.body));
        Provider.of<ModelsProvider>(context, listen: false).setUserInfo(result);
        return result;
      } else {
        return UserInfo();
      }
    } catch (e) {
      print(e);
      return UserInfo();
    }
  }

  //Update User
////////////
/////////////
  ///
//////
  ///
  static Future<bool> updateUser(
    BuildContext context,
    // String password,

    String firstName,
    String lastName,
  ) async {
    User result;
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});

      var response = await http.post(baseUrl + "auth/updateUser", body: {
        "first_name": firstName,
        "last_name": lastName,
      }, headers: {
        'Authorization': 'Bearer ' + token,
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  ///Update Profile Image
  ///
  ///
  static Future<bool> updateProfileImage(
      File image, BuildContext context) async {
    String token = Provider.of<ModelsProvider>(context, listen: false).token;
    await Manager.getAuthToken().then((val) => {token = val});
    var req = http.MultipartRequest(
        'POST', Uri.parse(baseUrl + 'auth/updateUserImage'));
    var multipartFile = await http.MultipartFile.fromPath("image", image.path,
        contentType: MediaType('image', 'png'));
    req.files.add(multipartFile);
    req.headers.addAll({
      'Authorization': 'Bearer ' + token,
      'Content-Type': 'application/json'
    });
    http.StreamedResponse response = await req.send();
    if (response.statusCode == 200) {
      print(response);
      return true;
    } else {
      false;
    }
  }

  //Add Address
////////////
/////////////
  ///
//////
  ///
  static Future<bool> addAddress(
      BuildContext context,
      String addressLine1,
      String addressLine2,
      String city,
      String fullname,
      String phone,
      String state,
      String email,
      String country) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});

      var response = await http.post(baseUrl + "auth/addUserAddress", body: {
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "city": city,
        "full_name": fullname,
        "state": state,
        "phone_number": phone,
        "country": country,
        "email": email,
      }, headers: {
        'Authorization': 'Bearer ' + token,
        // 'Content-Type': 'application/json'
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  /////
  ///
  ///Update Password
  static Future<bool> updatePassword(
      BuildContext context, String password) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});

      var response =
          await http.post(baseUrl + "auth/updateUserPassword", body: {
        "password": password,
        "c_password": password,
      }, headers: {
        'Authorization': 'Bearer ' + token,
        // 'Content-Type': 'application/json'
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<HomeInfo> getHomeData(BuildContext context) async {
    try {
      var response = await http.get(baseUrl + "GetHomePage", headers: {});

      if (response.statusCode == 200) {
        final results = HomeInfo.fromJson(convert.jsonDecode(response.body));

        Provider.of<ModelsProvider>(context, listen: false)
            .setProducts(results.productsToShow);
        Provider.of<ModelsProvider>(context, listen: false)
            .setCategories(results.categories);
        Provider.of<ModelsProvider>(context, listen: false)
            .setBanners(results.banners);
        Provider.of<ModelsProvider>(context, listen: false)
            .setCategoriesToShow(results.categoriesToShow);

        return results;
      } else {
        return HomeInfo();
      }
    } catch (e) {
      print(e);
      return HomeInfo();
    }
  }

  ////
  ///
  ///
  ///Delete Address
  static Future<bool> deleteAddress(int id, BuildContext context) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});
      var response =
          await http.post(baseUrl + "auth/deleteUserAddress", headers: {
        'Authorization': 'Bearer ' + token,
      }, body: {
        'id': id.toString()
      });
      if (response.statusCode == 200) {
        Manager.toastMessage('Address deleted', Colors.green);
        return true;
      } else {
        Manager.toastMessage('Address was not deleted ', Colors.red);
        return false;
      }
    } catch (e) {
      Manager.toastMessage('Address was not deleted ', Colors.red);
      print(e);
      return false;
    }
  }

  ////
  ///
  ///
  ///Products Details
  static Future<ProductDetails> getProductDetails(
      int id, BuildContext context) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});
      var response = await http.post(baseUrl + "getProductData", headers: {
        'Authorization': 'Bearer ' + token,
      }, body: {
        'id': id.toString()
      });
      if (response.statusCode == 200) {
        var result = ProductDetails.fromJson(response.body);

        return result;
      } else {
        Manager.toastMessage('Something Went Wrong ', Colors.red);
        return ProductDetails();
      }
    } catch (e) {
      Manager.toastMessage('Something Went Wrong ', Colors.red);
      print(e);
      return ProductDetails();
    }
  }

  ////
  ///
  ///
  ///Get Cart Items
  static Future<List<CartItem>> getCartProducts(BuildContext context) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});

      if (token == "") {
        Provider.of<ModelsProvider>(context, listen: false).setCartItems([]);
        return [];
      }

      var response = await http.get(baseUrl + "cart", headers: {
        'Authorization': 'Bearer ' + token,
      });
      if (response.statusCode == 200) {
        final results = cartItemFromJson(response.body);
        Provider.of<ModelsProvider>(context, listen: false)
            .setCartItems(results);
        return results;
      } else {
        Manager.toastMessage('Something Went Wrong ', Colors.red);
        return [];
      }
    } catch (e) {
      Manager.toastMessage('Something Went Wrong ', Colors.red);
      print(e);
      return [];
    }
  }

  ////
  ///
  ///
  ///Delete Cart Items
  static Future<bool> deleteItemFromCart(int id, BuildContext context) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});
      var response = await http.delete(baseUrl + "cart/$id", headers: {
        'Authorization': 'Bearer ' + token,
      });
      if (response.statusCode == 204) {
        Provider.of<ModelsProvider>(context, listen: false)
            .removeItemFromCart(id);

        return true;
      } else {
        Manager.toastMessage('Something Went Wrong ', Colors.red);
        return false;
      }
    } catch (e) {
      Manager.toastMessage('Something Went Wrong ', Colors.red);
      print(e);
      return false;
    }
  }

  ////
  ///
  ///
  ///Add Cart Items
  static Future<bool> addItemToCart(
      String options, int id, int quantity, BuildContext context) async {
    try {
      String token = "";
      await Manager.getAuthToken().then((val) => {token = val});
      var response = await http.post(
          baseUrl + 'cart?product_id=$id&options=$options&quantity=$quantity',
          headers: {
            'Authorization': 'Bearer ' + token,
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        Manager.toastMessage('Something Went Wrong ', Colors.red);
        return false;
      }
    } catch (e) {
      Manager.toastMessage('Something Went Wrong ', Colors.red);
      print(e);
      return false;
    }
  }

/////
  ///
  ///
  ///Upadte Cart Item
  static Future<bool> updateCartItem(int id, int productID, int quantity,
      BuildContext context, String options) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});
      var response = await http.put(
          baseUrl + "cart/$id?options=$options&quantity=$quantity",
          headers: {
            'Authorization': 'Bearer ' + token,
          });
      if (response.statusCode == 201) {
        HttpServices.getCartProducts(context);
        return true;
      } else {
        Manager.toastMessage('Something Went Wrong ', Colors.red);
        return false;
      }
    } catch (e) {
      Manager.toastMessage('Something Went Wrong ', Colors.red);
      print(e);
      return false;
    }
  }

  //////
  ///
  ///
  ///Add Product to wishList
  static Future<bool> addItemToWishlist(
      int productID, BuildContext context) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});
      var response = await http.post(baseUrl + "wishlist", body: {
        'product_id': productID.toString()
      }, headers: {
        'Authorization': 'Bearer ' + token,
      });
      if (response.statusCode == 201) {
        Manager.toastMessage('Added to wishlist', signInStartColor);
        return true;
      } else {
        Manager.toastMessage('Something Went Wrong ', Colors.red);
        return false;
      }
    } catch (e) {
      Manager.toastMessage('Something Went Wrong ', Colors.red);
      print(e);
      return false;
    }
  }

  //////
  ///
  ///
  ///Get Product wishList
  static Future<bool> getWishList(BuildContext context) async {
    try {
      String token = "";
      await Manager.getAuthToken().then((val) => {token = val});
      if (token == "") {
        Provider.of<ModelsProvider>(context, listen: false)
            .setWishListItems([]);
        return false;
      }
      await Manager.getAuthToken().then((val) => {token = val});
      var response = await http.get(baseUrl + "wishlist", headers: {
        'Authorization': 'Bearer ' + token,
      });
      if (response.statusCode == 200) {
        var results = wishListItemFromJson(response.body);
        Provider.of<ModelsProvider>(context, listen: false)
            .setWishListItems(results);
        return true;
      } else {
        Manager.toastMessage('Something Went Wrong ', Colors.red);
        return false;
      }
    } catch (e) {
      Manager.toastMessage('Something Went Wrong ', Colors.red);
      print(e);
      return false;
    }
  }

  ////
  ///
  ///
  ///Delete itme from wishlist
  static Future<bool> deleteItemFromWishList(
      int id, BuildContext context, int index) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});
      var response = await http.delete(baseUrl + "wishlist/$id", headers: {
        'Authorization': 'Bearer ' + token,
      });
      if (response.statusCode == 204) {
        Provider.of<ModelsProvider>(context, listen: false)
            .removeFromWishlist(index);
        return true;
      } else {
        Manager.toastMessage('Something Went Wrong ', Colors.red);
        return false;
      }
    } catch (e) {
      Manager.toastMessage('Something Went Wrong ', Colors.red);
      print(e);
      return false;
    }
  }

  //////
  ///
  ///
  ///Add Product to wishList
  static Future<bool> checkout(
      String cardNumber,
      String expYear,
      String expMonth,
      String paymentMethod,
      String currency,
      String cvc,
      BuildContext context) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});
      var response = await http.post(baseUrl + "order", body: {
        'payment_method': paymentMethod,
        'number': cardNumber,
        'exp_year': expYear,
        'exp_month': expMonth,
        'currency': 'sar',
        'cvc': cvc
      }, headers: {
        'Authorization': 'Bearer ' + token,
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        Manager.toastMessage('Checkout Done', signInStartColor);
        return true;
      } else if (response.statusCode == 402) {
        Manager.toastMessage('Your Card Number is not Valid ', Colors.red);
        return false;
      } else {
        Manager.toastMessage('Something Went Wrong ', Colors.red);
        return false;
      }
    } catch (e) {
      Manager.toastMessage('Something Went Wrong ', Colors.red);
      print(e);
      return false;
    }
  }

  //////
  ///
  ///
  ///Add Product to wishList
  static Future<SearchResponse> search(
      String keyword, String cat, String page, BuildContext context) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});
      if (cat == "0") {
        cat = "";
      }
      var response = await http.post(baseUrl + "searchProducts", body: {
        'category': cat,
        'search': keyword,
        'page': page
      }, headers: {
        'Authorization': 'Bearer ' + token,
      });
      if (response.statusCode == 200) {
        var result = SearchResponse.fromJson(convert.jsonDecode(response.body));

        return result;
      } else {
        Manager.toastMessage('Something Went Wrong ', Colors.red);
        return SearchResponse();
      }
    } catch (e) {
      Manager.toastMessage('Something Went Wrong ', Colors.red);
      print(e);
      return SearchResponse();
    }
  }

  ///
  ///
  ///
  ///Get user Orders

  static Future<List<Order>> getUserOrders(BuildContext context) async {
    try {
      String token = Provider.of<ModelsProvider>(context, listen: false).token;
      await Manager.getAuthToken().then((val) => {token = val});

      var response = await http.get(baseUrl + "order", headers: {
        'Authorization': 'Bearer ' + token,
      });
      if (response.statusCode == 200) {
        var results = orderFromJson(response.body);
        return results;
      } else {
        Manager.toastMessage('Something Went Wrong ', Colors.red);
        return [];
      }
    } catch (e) {
      Manager.toastMessage('Something Went Wrong ', Colors.red);

      print(e);
      return [];
    }
  }
}
