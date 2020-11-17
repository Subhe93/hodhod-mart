import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/AdBanners.dart';
import 'package:hodhod_mart/model/MainCategory.dart';

import 'package:hodhod_mart/model/ResponsModels/Startup.dart';

class ModelsProvider extends ChangeNotifier {
  List<MainCategory> categories = [];
  List<AdBanner> banners = [];
  bool homeIsLoading = true;

  void setCategories(List<MainCategory> values) {
    categories = values;
    if (banners.isNotEmpty) {
      homeIsLoading = false;
    }
    notifyListeners();
  }

  void setBanners(List<AdBanner> values) {
    banners = values;
    if (categories.isNotEmpty) {
      homeIsLoading = false;
    }
    notifyListeners();
  }
}
