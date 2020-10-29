import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget CustomBottomAppBar(BuildContext context) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    notchMargin: 5,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 32,
                  child: SvgPicture.asset('assets/svg/home-01.svg')),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 32,
                  child: SvgPicture.asset('assets/svg/search-03.svg')),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 32,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 32,
                  child: SvgPicture.asset('assets/svg/love-02.svg')),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 32,
                  child: SvgPicture.asset('assets/svg/cart-04.svg')),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  'Cart',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
