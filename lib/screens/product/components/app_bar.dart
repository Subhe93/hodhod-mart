import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/presentation/my_flutter_app_icons.dart';

Widget productAppBar(BuildContext context) {
  double containerHeight = 40;
  double containerWidth = 40;
  double imageRadius = 20;

  return Padding(
    padding: const EdgeInsets.only(left : 15.0 , right: 15 , top: 40),
    child: Container(
      color: Colors.transparent,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(imageRadius),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_backspace,
                color: appBarIconsColor,
                size: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: containerWidth,
                height: containerHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(imageRadius),
                ),
                child: IconButton (
                  onPressed: (){},
                  icon: Icon (
                      MyFlutterApp.cart_04,
                  color: appBarIconsColor,
                  size: 20,),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: containerWidth,
                height: containerHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(imageRadius),
                ),
                child: IconButton (
                  onPressed: (){},
                  icon: Icon (MyFlutterApp.love_02,
                  color: appBarIconsColor,
                  size: 20,),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
