

import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/my_cart/cart_card.dart';

import '../../constants.dart';
class NewCartBody extends StatefulWidget {
  final List<String> cartArray = ['s', 's','s','s'];
  @override
  _NewCartBodyState createState() => _NewCartBodyState();
}

class _NewCartBodyState extends State<NewCartBody> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset(
              'assets/ad1.png',
              fit: BoxFit.cover,
            )),

            ListView(
            shrinkWrap: true,
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

        Container(
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
        )

      ],),
    );
  }
}
