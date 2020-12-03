import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/Cart.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';

import '../../constants.dart';
import 'edit_order.dart';

class CartCard extends StatefulWidget {
  final CartItem item;

  const CartCard({Key key, this.item}) : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  bool loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    var width2 = 30.0;
    var height2 = 30.0;
    return loading
        ? Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            child: Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return EditOrder(item: widget.item);
                    },
                  ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              widget.item.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: signInStartColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(15.0),
                        //   child: InkWell(
                        //     onTap: () => showDeleteAlert(context),
                        //     child: Icon(
                        //       Icons.delete,
                        //       size: 20,
                        //       color: Colors.red[800],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .60,
                            child: Text(
                              widget.item.shortDescription,
                              maxLines: 3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              baseUrl + widget.item.mainImage,
                              height: MediaQuery.of(context).size.height / 15,
                              width: MediaQuery.of(context).size.width * .20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.item.price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: .8,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Order Now And get ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Free Shipping',
                                    style: TextStyle(
                                      color: signInStartColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width2,
                              height: height2,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.transparent),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: width2 / 2.7, top: height2 / 2.5),
                                child: TextField(
                                  style: TextStyle(fontSize: width2 / 2),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration().copyWith(
                                      hintText:
                                          widget.item.quantity.toString()),
                                ),
                              ),
                            ),
                            // Container(
                            //   child: Center(
                            //     child: Chip(
                            //       label: Text(
                            //         'Fast Delivery',
                            //         style: TextStyle(color: Colors.white),
                            //       ),
                            //       backgroundColor: signInStartColor,
                            //     ),
                            //   ),
                            // ),
                            Container(
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 10,
                  bottom: 10,
                  child: InkWell(
                    onTap: () {
                      showDeleteAlert(widget.item.id, context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Icon(
                          Icons.delete,
                          size: 30,
                          color: signInEndColor,
                        ),
                      ),
                    ),
                  )),
            ],
          ));
  }

  showDeleteAlert(int id, BuildContext dialogContext) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Remove"),
      onPressed: () {
        Navigator.pop(context);
        setState(() => {loading = true});
        HttpServices.deleteItemFromCart(id, context).then((value) => {
              if (value) {loading = false}
            });
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
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
