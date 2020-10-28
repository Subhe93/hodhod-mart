import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';
import 'package:hodhod_mart/screens/my_cart/body.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: null,
      //     label: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Icon(Icons.account_balance_wallet),
      //         SizedBox(width: 10),
      //         Text('Proceed to Checkot'),
      //       ],
      //     )),
      appBar: accountAppBar(context, false, 'My Cart', true),
      body: Stack(children: [
        MyCartBody(),
        // Positioned(
        //     bottom: 0,
        //     child: GestureDetector(
        //       child: Container(
        //         height: MediaQuery.of(context).size.height / 15,
        //         width: MediaQuery.of(context).size.width,
        //         color: Colors.blue.withOpacity(0.8),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Icon(
        //               Icons.account_balance_wallet,
        //               color: Colors.white,
        //             ),
        //             SizedBox(
        //               width: 15,
        //             ),
        //             Text(
        //               'Proceed To Checkout',
        //               style: TextStyle(
        //                   color: Colors.white, fontWeight: FontWeight.w600),
        //             )
        //           ],
        //         ),
        //       ),
        //     ))
      ]),
    );
  }
}
