import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/screens/notifiations/notifications.dart';
import 'package:hodhod_mart/screens/search/search_page.dart';

Widget searchAction(BuildContext context) {
  return IconButton(
    icon: Icon(
      Icons.search,
      color: appBarIconsColor,
      size: 30,
    ),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SearchPage();
      }));
    },
  );
}

Widget logOutAction() {
  return IconButton(
    icon: Icon(
      Icons.exit_to_app,
      color: appBarIconsColor,
      size: 30,
    ),
    onPressed: () {},
  );
}

Widget homeAppBar(bool search, bool notification, BuildContext context,
    bool padding, String title, IconButton action) {
  return PreferredSize(
    preferredSize: padding ? Size.fromHeight(80) : Size.fromHeight(50),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: padding
          ? Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 45,
                    width: 100,
                  ),
                  // Text(
                  //   'HODHOD MART',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //   ),
                  // ),
                ],
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 45,
                  width: 100,
                ),
                // Text(
                //   title,
                //   style: TextStyle(
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
      leading: notification
          ? IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Notifications();
                }));
              },
              icon: Icon(
                Icons.notifications_none,
                color: appBarIconsColor,
                size: 30,
              ),
            )
          : Container(
              width: 45,
            ),
      actions: [
        search
            ? action
            : Container(
                height: 0,
                width: 50,
              ),
      ],
    ),
  );
}
