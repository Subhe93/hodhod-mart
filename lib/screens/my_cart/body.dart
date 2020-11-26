import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hodhod_mart/model/Cart.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:hodhod_mart/screens/checkout/checkout.dart';
import 'package:hodhod_mart/screens/my_cart/cart_card.dart';
import 'package:hodhod_mart/screens/my_cart/edit_order.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class NewCartBody extends StatefulWidget {
  @override
  _NewCartBodyState createState() => _NewCartBodyState();
}

class _NewCartBodyState extends State<NewCartBody> {
  bool loading;
  bool deletingIndicator;
  int _value = 1;
  List<CartItem> cart;

  @override
  void initState() {
    loading = true;
    deletingIndicator = false;
    cart = [];
    super.initState();
    HttpServices.getCartProducts(context).then((value) => {
          if (mounted)
            {
              setState(() => {loading = false})
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    cart = Provider.of<ModelsProvider>(context, listen: true).cartItems;
    return SingleChildScrollView(
      child: loading
          ? Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Image.asset(
                      'assets/ad1.png',
                      fit: BoxFit.cover,
                    )),
                cart.isEmpty
                    ? Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Your Cart is Empty',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: signInStartColor),
                              ),
                              Icon(
                                Icons.remove_shopping_cart,
                                color: signInStartColor,
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250 * cart.length.toDouble(),
                        child: ListView.builder(
                          itemCount: cart.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return EditOrder(
                                          item: cart[index],
                                        );
                                      },
                                    ));
                                  },
                                  child: CartCard(
                                    item: cart[index],
                                  )),
                              Divider()
                            ],
                          ),
                        ),
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
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: TextField(
                              decoration: InputDecoration(
                                  suffixIcon: FlatButton(
                                    child: Text(
                                      'Enter',
                                      style: TextStyle(color: signInStartColor),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Total Items'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(cart.length.toString())
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        child: Text("Second Location"),
                                        value: 2,
                                      ),
                                      DropdownMenuItem(
                                          child: Text("Third Location"),
                                          value: 3),
                                      DropdownMenuItem(
                                          child: Text("Fourth Location"),
                                          value: 4)
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    })
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              'SAR ' +
                                  Provider.of<ModelsProvider>(context,
                                          listen: true)
                                      .total
                                      .toString(),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Checkout();
                                  },
                                ),
                              );
                            },
                            color: Colors.blue,
                            child: Text(
                              'Procced to checkout',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }

  showDeleteAlert(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("remove"),
      onPressed: () {},
    );
    Widget continueButton = FlatButton(
      child: Text("cancel"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete"),
      content: Text("Are you sure you want to remove product"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
