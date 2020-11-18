import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:provider/provider.dart';
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
  static Future<void> setAuthToken(String authToken, context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', authToken);
    Provider.of<ModelsProvider>(context, listen: false).setToken(authToken);
  }

//get value from shared preferences
  static Future<String> getAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String authToken = pref.getString('token') ?? null;
    return authToken;
  }

  static Future<String> isLoggedIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String authToken = pref.getString('token') ?? null;

    if (authToken == null || authToken.isEmpty) {
      return '';
    } else {
      return authToken;
    }
  }
}
