import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';

Widget accountAppBar(
    BuildContext context, bool showLogout, String title, bool showCart) {
  return PreferredSize(
    preferredSize: Size.fromHeight(58),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 20),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: kTextColor,
            ),
          ),
        ),
      ),
      leading: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10),
          child: Container(
            width: 45,
          )),
      actions: [
        Row(
          children: [
            Container(
              width: 45,
            )
          ],
        ),
      ],
    ),
  );
}
