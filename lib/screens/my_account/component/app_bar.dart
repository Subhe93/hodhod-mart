import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';

Widget accountAppBar( BuildContext context , bool showLogout , String title , bool showCart) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only( top : 30.0 , bottom : 20),
        child: Center(
          child: Text (
            title,
            style: TextStyle (
              color: kTextColor,
            ),),
        ),
      ) ,
      leading:Padding(
        padding: const EdgeInsets.only(top : 10.0 , left: 10),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: appBarIconsColor,
            size: 30,
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top : 20.0 , right: 0 , bottom: 10),
              child: showCart ?
              SvgPicture.asset(
                  'assets/svg/cart-04.svg',
                color: kTextColor,
              ):
              SizedBox(
                width:30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top : 10.0 , right: 10),
              child: showLogout ?
              IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: appBarIconsColor,
                  size: 30,
                ),
                onPressed: () {},
              ):
              SizedBox(
                width:1,
              ),
            ),
          ],
        ),

      ],
    ),
  );
}
