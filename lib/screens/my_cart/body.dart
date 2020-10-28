import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/screens/checkout/checkout.dart';
import 'package:hodhod_mart/screens/my_cart/cart_card.dart';

import '../../constants.dart';
import '../homePage/components/ads.dart';

class MyCartBody extends StatefulWidget {
  final List<String> cartArray = ['s', 's'];

  @override
  _MyCartBodyState createState() => _MyCartBodyState();
}

class _MyCartBodyState extends State<MyCartBody> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 70,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Image.asset(
                  'assets/ad1.png',
                  fit: BoxFit.cover,
                )),
            Container(
              height: MediaQuery.of(context).size.height,
              child: widget.cartArray.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView(
                            physics: ClampingScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 10),
                            children: widget.cartArray.map((String value) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(child: CartCard()),
                                  Divider()
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.blue[50],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            suffixIcon: FlatButton(
                                              child: Text(
                                                'Enter',
                                                style: TextStyle(
                                                    color: signInStartColor),
                                              ),
                                              color: Colors.transparent,
                                            ),
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter Coupon Code'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Total Items'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('2')
                                        ],
                                      ),
                                      Text(
                                        'SAR 500',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[900],
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Deliver To   ',
                                            style: TextStyle(
                                                color: Colors.grey[900],
                                                fontWeight: FontWeight.w500),
                                          ),
                                          DropdownButton(
                                              value: _value,
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text("First Location"),
                                                  value: 1,
                                                ),
                                                DropdownMenuItem(
                                                  child:
                                                      Text("Second Location"),
                                                  value: 2,
                                                ),
                                                DropdownMenuItem(
                                                    child:
                                                        Text("Third Location"),
                                                    value: 3),
                                                DropdownMenuItem(
                                                    child:
                                                        Text("Fourth Location"),
                                                    value: 4)
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  _value = value;
                                                });
                                              })
                                        ],
                                      ),
                                      Text(
                                        'SAR 0',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[900],
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Total',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey[900],
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text('(Including VAT)',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ))
                                        ],
                                      ),
                                      Text(
                                        'SAR 500',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[900],
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 35),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: FlatButton(
                                      onPressed: () {},
                                      color: Colors.blue,
                                      child: Text(
                                        'Procced to checkout',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration inputDecoration() {}
