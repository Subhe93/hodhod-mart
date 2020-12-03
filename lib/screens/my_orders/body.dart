import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/model/Order.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/screens/my_orders/order_card.dart';

class MyOrdersBody extends StatefulWidget {
  @override
  _MyOrdersBodyState createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody> {
  List<Order> orders;
  bool loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
    orders = [];
    HttpServices.getUserOrders(context).then((value) => {
          setState(() => {loading = false, orders = value})
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white54.withOpacity(0.5),
              child: orders.isNotEmpty
                  ? ListView(
                      children: orders.map((Order value) {
                        return MyOrderCard(
                          order: value,
                        );
                      }).toList(),
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
                                    'assets/svg/empty_order.svg',
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    'You have no orders yet!!!',
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
