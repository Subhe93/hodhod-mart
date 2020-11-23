import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/AdBanners.dart';
import 'package:hodhod_mart/model/Address.dart';
import 'package:hodhod_mart/model/MainCategory.dart';

import 'package:hodhod_mart/model/ResponsModels/Startup.dart';
import 'package:hodhod_mart/model/ResponsModels/userInfo.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:hodhod_mart/model/User.dart';

class ModelsProvider extends ChangeNotifier {
  List<MainCategory> categories = [];
  List<AdBanner> banners = [];
  List<List<Product>> homeProducts = [];
  User user;
  List<Address> addresses = [];
  String token;
  List<MainCategory> categoriesToShow = [];

  void setCategories(List<MainCategory> values) {
    categories = values;
    notifyListeners();
  }

  void setCategoriesToShow(List<MainCategory> values) {
    categoriesToShow = values;
    notifyListeners();
  }

  void setProducts(List<List<Product>> _products) {
    homeProducts = _products;
    notifyListeners();
  }

  Void setUserInfo(UserInfo newUser) {
    user = newUser.user;
    addresses = newUser.addresses;
    notifyListeners();
  }

  void addAddress(Address address) {
    addresses.add(address);
    notifyListeners();
  }

  Void setUser(User newUser) {
    user = newUser;
    notifyListeners();
  }

  void setBanners(List<AdBanner> values) {
    banners = values;
    notifyListeners();
  }

  void setToken(String newToken) {
    token = newToken;
    notifyListeners();
  }
}
