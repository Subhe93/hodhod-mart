import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';

import '../../constants.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: accountAppBar(context, false, 'ORDER 123123', true),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10,
            color: Colors.black.withOpacity(0.05),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Order Details :',
                style: TextStyle(
                    color: signInStartColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      'Order ID :',
                      style: TextStyle(
                          color: signInEndColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '123123123',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Status :',
                      style: TextStyle(
                          color: signInEndColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Pending',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Total :',
                      style: TextStyle(
                          color: signInEndColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '400.0',
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Payment Method :',
                      style: TextStyle(
                          color: signInEndColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Paypal',
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Date :',
                      style: TextStyle(
                          color: signInEndColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '20:20:2020 22:22',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 10,
            color: Colors.black.withOpacity(0.05),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Order Products :',
                      style: TextStyle(
                          color: signInStartColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  height: 120,
                  child: Row(
                    children: [
                      Container(width: 100,height: 100)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
