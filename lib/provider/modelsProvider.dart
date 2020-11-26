import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/AdBanners.dart';
import 'package:hodhod_mart/model/Address.dart';
import 'package:hodhod_mart/model/Cart.dart';
import 'package:hodhod_mart/model/MainCategory.dart';

import 'package:hodhod_mart/model/ResponsModels/userInfo.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:hodhod_mart/model/User.dart';
import 'package:hodhod_mart/model/whoshlist_model.dart';

class ModelsProvider extends ChangeNotifier {
  List<MainCategory> categories = [];
  List<AdBanner> banners = [];
  List<List<Product>> homeProducts = [];
  User user;
  List<Address> addresses = [];
  String token;
  List<MainCategory> categoriesToShow = [];
  List<CartItem> cartItems = [];
  double total;
  List<WishListItem> wishlistItems = [];

  void setWishListItems(List<WishListItem> items) {
    wishlistItems = items;
    notifyListeners();
  }

  void removeFromWishlist(index) {
    wishlistItems.removeAt(index);
    notifyListeners();
  }

  void setCartItems(List<CartItem> items) {
    cartItems = items;
    var t = 0.0;
    for (var item in items) {
      t = t + item.price * item.quantity;
    }
    total = t;
    notifyListeners();
  }

  void updateCart(CartItem item, int index) {
    cartItems[index] = item;
    notifyListeners();
  }

  void removeItemFromCart(int id) {
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id == id) {
        cartItems.removeAt(i);
      }
    }
    setCartItems(cartItems);
    notifyListeners();
  }

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
