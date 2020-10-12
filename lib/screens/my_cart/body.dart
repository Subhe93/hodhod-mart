import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/screens/checkout/checkout.dart';
import 'package:hodhod_mart/screens/my_cart/cart_card.dart';

class MyCartBody extends StatefulWidget {
  final List<String> cartArray = ['s','s','s','s','s'];

  @override
  _MyCartBodyState createState() => _MyCartBodyState();
}

class _MyCartBodyState extends State<MyCartBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white54.withOpacity(0.5),
        child: widget.cartArray.isNotEmpty
            ? Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 10),
                    children: widget.cartArray.map((String value) {
                      return Column(
                        children: [
                          InkWell(child: CartCard()),
                          SizedBox (
                            height: 1,
                            child: Container (
                              color: Colors.grey.withOpacity(0.7),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white54,
                      child: Column (
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 1,
                            child: Container (
                              color: Colors.grey.withOpacity(0.7),
                          ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(25.0 , 0 , 25 , 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0 , 15 , 0 , 15),
                                      child: Row (
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text (
                                              'Subtotal',
                                          style: TextStyle (
                                            fontSize: 17,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w500
                                          ),),
                                          Text (
                                            '100.00 SR',
                                            style: TextStyle (
                                              fontSize: 17,
                                              color: kTextColor,
                                                fontWeight: FontWeight.w500
                                            ),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0 , 15 , 0 , 15),
                                      child: Row (
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text (
                                            'Estimated Tax',
                                            style: TextStyle (
                                                fontSize: 17,
                                                color: kTextColor,
                                                fontWeight: FontWeight.w500
                                            ),),
                                          Text (
                                            '18.00 SR',
                                            style: TextStyle (
                                                fontSize: 17,
                                                color: kTextColor,
                                                fontWeight: FontWeight.w500
                                            ),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0 , 15 , 0 , 15),
                                      child: Row (
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text (
                                            'Shipping \$ Return',
                                            style: TextStyle (
                                                fontSize: 17,
                                                color: kTextColor,
                                                fontWeight: FontWeight.w500
                                            ),),
                                          Text (
                                            'Subtotal',
                                            style: TextStyle (
                                                fontSize: 17,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.w500
                                            ),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1,
                                child: Container (
                                  color: Colors.grey.withOpacity(0.7),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(25.0 , 13 , 25 , 13),
                                child: Row (
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text (
                                      'Total Price',
                                      style: TextStyle (
                                          fontSize: 17,
                                          color: kTextColor,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    Text (
                                      '118.00 SR',
                                      style: TextStyle (
                                          fontSize: 17,
                                          color: kTextColor,
                                          fontWeight: FontWeight.w500
                                      ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Checkout();
                        }));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Colors.deepPurple,
                        child: Center(
                            child: Text(
                              'PROCEED TO CHECKOUT',
                              style:  TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                ],
            )
            : Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 150),
                            width: 200,
                            height: 200,
                            child: SvgPicture.asset(
                              'assets/svg/order.svg',
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              'Your order is empty!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 250,
                            child: Text(
                              'Explore more and buy some items',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.7),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Colors.deepPurple,
                        child: Center(
                            child: Text(
                          'START SHOPPING',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
