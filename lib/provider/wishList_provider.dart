import 'package:flutter/cupertino.dart';
import 'package:hodhod_mart/model/AdBanners.dart';

import 'package:hodhod_mart/model/ResponsModels/Startup.dart';

import 'package:hodhod_mart/model/whoshlist_model.dart';
import 'package:hodhod_mart/util/session_manager.dart';

class WishListProvider with ChangeNotifier {
  bool loading = false;
  SessionManager sessionManager = SessionManager();
  List<WishListItem> wishList = [];
  double _totalPrice = 0;
  WishListModel cartModel = WishListModel();
  List<AdBanner> banners = [];

  getWish() async {
    try {
      Future<WishListModel> wish = sessionManager.getWishList();
      wish.then((data) {
        wishList = data.wishListItem;

        notifyListeners();
      }, onError: (e) {
        print(e);
      });
    } catch (e) {}
  }

  void setBanners(List<AdBanner> images) {
    banners = images;
    notifyListeners();
  }

  void saveCart() {
    try {
      cartModel.wishListItem = wishList;
      sessionManager.setWishList(cartModel);
    } catch (e) {}
  }

  void add(WishListItem wishItem) {
    int index = contains(wishItem);

    wishList.add(wishItem);

    notifyListeners();
  }

  void remove(WishListItem wishItem) {
    _totalPrice -= wishItem.price;
    wishList.remove(wishItem);
    this.saveCart();
    notifyListeners();
  }

  void removeAtIndex(int index) {
    _totalPrice -= wishList[index].price;
    wishList.removeAt(index);
    this.saveCart();
    notifyListeners();
  }

  int get count {
    return wishList.length;
  }

  List<WishListItem> get basketCarts {
    return wishList;
  }

  int contains(WishListItem wish) {
    for (int i = 0; i < wishList.length; i++) {
      if (wish.id == wishList[i].id) {
        return i;
      }
    }
    return -1;
  }
}
