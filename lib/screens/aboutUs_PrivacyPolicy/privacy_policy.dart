import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Colors.white,
          secondaryHeaderColor: signInStartColor,
          accentColor: signInStartColor),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Privacy Policy',
          ),
        ),
        body: SafeArea(
            child: Container(
          child: WebView(
            initialUrl: 'https://hodhodmart.hashtagweb.online/privacy_policy',
          ),
        )),
      ),
    );
  }
}
