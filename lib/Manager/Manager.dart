import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/model/User.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';

import 'package:hodhod_mart/screens/register/createAccount.dart';
import 'package:hodhod_mart/screens/register/signIn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:connectivity/connectivity.dart';
import 'dart:io';
import '../constants.dart';

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

  static void successDialog(
      String message, String title, BuildContext context) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: title,
        desc: message,
        autoHide: Duration(seconds: 2))
      ..show();
  }

  static void errorDialog(String message, String title, BuildContext context) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: title,
        desc: message,
        autoHide: Duration(seconds: 2))
      ..show();
  }

  static void noConnectionAlert(BuildContext context) {
    AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        dialogType: DialogType.NO_HEADER,
        body: Center(
            child: Column(
          children: [
            Icon(
              Icons.wifi_off,
              size: 100,
              color: signInEndColor,
            ),
            Text(Applocalizations.of(context).translate("No Internet Access"))
          ],
        )),
        title: Applocalizations.of(context).translate("No Internet Access"),
        desc: Applocalizations.of(context)
            .translate("Please Connect to internet and try again"),
        autoHide: Duration(seconds: 2))
      ..show();
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

  static Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String authToken = pref.getString('token') ?? null;

    if (authToken == null || authToken.isEmpty) {
      return '';
    } else {
      return authToken;
    }
  }

  static Future<bool> logout(BuildContext context) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', '');
    Provider.of<ModelsProvider>(context, listen: false).setToken('');
    Provider.of<ModelsProvider>(context, listen: false).setUser(User());
    Provider.of<ModelsProvider>(context, listen: false).setCartItems([]);
    Provider.of<ModelsProvider>(context, listen: false).setWishListItems([]);

    return true;
  }

  static Future<bool> checkInternet(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          Provider.of<ModelsProvider>(context, listen: false)
              .setInternetAccess(true);
        }
      } on SocketException catch (_) {
        Provider.of<ModelsProvider>(context, listen: false)
            .setInternetAccess(false);
        return false;
      }

      return true;
    } else {
      Provider.of<ModelsProvider>(context, listen: false)
          .setInternetAccess(false);
    }

    return false;
  }

  static void openRegisterSheet(context) async {
    showModalBottomSheet<dynamic>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: (context),
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: 320,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Applocalizations.of(context).translate(
                          "Your not Registerd Please login or create a new Account"),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignIn();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.yellow,
                        gradient: LinearGradient(
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.7, 0.0),
                          colors: [signInStartColor, signInEndColor],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Applocalizations.of(context).translate("Sign In"),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CareateAccount();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.yellow,
                        gradient: LinearGradient(
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.7, 0.0),
                          colors: [signInStartColor, signInEndColor],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Applocalizations.of(context)
                              .translate("Create Account"),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.yellow,
                        gradient: LinearGradient(
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.7, 0.0),
                          colors: [signInStartColor, signInEndColor],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Applocalizations.of(context).translate("Cancel"),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
