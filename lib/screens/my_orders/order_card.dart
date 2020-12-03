import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/Order.dart';
import 'package:hodhod_mart/screens/my_orders/orderDetails.dart';
import 'package:hodhod_mart/screens/track_order/track_order.dart';

class MyOrderCard extends StatefulWidget {
  final Order order;

  const MyOrderCard({Key key, this.order}) : super(key: key);
  @override
  _MyOrderCardState createState() => _MyOrderCardState();
}

class _MyOrderCardState extends State<MyOrderCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: signInStartColor.withOpacity(0.2),
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
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
                      widget.order.id.toString(),
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                      widget.order.status == 0 ? 'Pending' : 'Success',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                      widget.order.total.toString(),
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                // Row(
                //   children: [Text('Payment Method :'), Text('PayPal')],
                // ),
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
                      widget.order.createdAt.toString(),
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OrderDetails();
              })),
              child: Container(
                decoration: BoxDecoration(
                    color: signInStartColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'View',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        CupertinoIcons.right_chevron,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
