import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/my_account/account_information/body.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';

class AccountInfo extends StatefulWidget {
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: AccountInfoBody (),
      appBar: accountAppBar(context, true, 'MY ACCOUNT', false),
    );
  }
}
