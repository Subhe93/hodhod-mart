
import 'package:hodhod_mart/model/whoshlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String whishList = "WISHLIST";

  setWishList(WishListModel wishListModel)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String wishList = wishListToJson(wishListModel);
    prefs.setString(this.whishList, wishList);
  }

  Future<WishListModel> getWishList() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    WishListModel wish = WishListModel();
    String stringWish ;
    stringWish = pref.getString(this.whishList) ?? null;
    wish = wishListFromJson(stringWish);
    return wish;
  }


}