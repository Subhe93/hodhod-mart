import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/Banners.dart';
import 'package:hodhod_mart/model/MainCategory.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';

class ModelsProvider extends ChangeNotifier {
  List<MainCategory> categories = [];
  List<AdBanner> banners;

  void setCategories(List<MainCategory> values) {
    categories = values;

    notifyListeners();
  }

  void setBanners(List<AdBanner> values) {
    banners = values;
    notifyListeners();
  }
}
