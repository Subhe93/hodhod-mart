import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/Address.dart';
import 'package:hodhod_mart/model/User.dart';
import 'package:hodhod_mart/screens/my_account/account_information/body.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({
    Key key,
  }) : super(key: key);
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AccountInfoBody(),
      appBar: accountAppBar(context, true, 'MY ACCOUNT', false),
    );
  }
}
