import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';
import '';

class ShippingCheckout extends StatefulWidget {
  @override
  _ShippingCheckoutState createState() => _ShippingCheckoutState();
}

class _ShippingCheckoutState extends State<ShippingCheckout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 250,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              width: MediaQuery.of(context).size.width,
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'SHIPPING ADDRESS',
                    maxLines: 1,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container (
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(0 , 20 , 0 , 15),
                    decoration: BoxDecoration (
                        border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                    ),
                    child : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text (
                        'Enter Your Address',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle (
                          fontSize: 16,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container (
                        height: 50,
                        width: (MediaQuery.of(context).size.width / 2 ) - 30,
                        margin: EdgeInsets.fromLTRB(0 , 0 , 0 , 10),
                        decoration: BoxDecoration (
                            border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                        ),
                        child : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text (
                            'City',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle (
                              fontSize: 16,
                              color: kTextColor,
                            ),
                          ),
                        ),
                      ),
                      Container (
                        height: 50,
                        width: (MediaQuery.of(context).size.width / 2 ) - 30,
                        margin: EdgeInsets.fromLTRB(0 , 0 , 0 , 10),
                        decoration: BoxDecoration (
                            border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                        ),
                        child : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text (
                            'State',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle (
                              fontSize: 16,
                              color: kTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container (
                        height: 50,
                        width: (MediaQuery.of(context).size.width / 2 ) - 30,
                        margin: EdgeInsets.fromLTRB(0 , 0 , 0 , 10),
                        decoration: BoxDecoration (
                            border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                        ),
                        child : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text (
                            'Zip Code',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle (
                              fontSize: 16,
                              color: kTextColor,
                            ),
                          ),
                        ),
                      ),
                      Container (
                        height: 50,
                        width: (MediaQuery.of(context).size.width / 2 ) - 30,
                        margin: EdgeInsets.fromLTRB(0 , 0 , 0 , 10),
                        decoration: BoxDecoration (
                            border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                        ),
                        child : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text (
                            'Country',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle (
                              fontSize: 16,
                              color: kTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 200,
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(0 , 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    width: MediaQuery.of(context).size.width,
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'CONTACT INFORMATION',
                          maxLines: 1,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container (
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(0 , 20 , 0 , 5),
                          decoration: BoxDecoration (
                              border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                          ),
                          child : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text (
                              'Enter Your First Name - Last Name',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle (
                                fontSize: 16,
                                color: kTextColor,
                              ),
                            ),
                          ),
                        ),
                        Container (
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(0 , 10 , 0 , 15),
                          decoration: BoxDecoration (
                              border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                          ),
                          child : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text (
                              'Enter Your Phone Number',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle (
                                fontSize: 16,
                                color: kTextColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
