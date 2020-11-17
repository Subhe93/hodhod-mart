import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Manager {
  static String token;

  static void toastMessage(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        backgroundColor: color,
        fontSize: 16.0);
  }

  //set data into shared preferences like this
  static Future<void> setAuthToken(String authToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(token, authToken);
  }

//get value from shared preferences
  static Future<String> getAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String authToken = pref.getString(token) ?? null;
    return authToken;
  }
}