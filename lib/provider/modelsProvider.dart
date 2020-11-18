import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/AdBanners.dart';
import 'package:hodhod_mart/model/MainCategory.dart';

import 'package:hodhod_mart/model/ResponsModels/Startup.dart';
import 'package:hodhod_mart/model/User.dart';

class ModelsProvider extends ChangeNotifier {
  List<MainCategory> categories = [];
  List<AdBanner> banners = [];
  bool homeIsLoading = true;
  User user;
  String token;

  void setCategories(List<MainCategory> values) {
    categories = values;
    if (banners.isNotEmpty) {
      homeIsLoading = false;
    }
    notifyListeners();
  }

  Void setUser(User newUser) {
    user = newUser;
    notifyListeners();
  }

  void setBanners(List<AdBanner> values) {
    banners = values;
    if (categories.isNotEmpty) {
      homeIsLoading = false;
    }
    notifyListeners();
  }

  void setToken(String newToken) {
    token = newToken;
    notifyListeners();
  }
}
