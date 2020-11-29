import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String cardNumber;
  String exp_year;
  String cvc;
  String exp_month;

  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _cvc = TextEditingController();
  final TextEditingController _exp_month = TextEditingController();
  final TextEditingController _exp_year = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int _value = 1;

    return Scaffold(
      appBar: homeAppBar(
          false, false, context, false, 'HODHOD MART', searchAction()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Checkout',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: signInStartColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Payment Method:',
                  style: TextStyle(
                    fontSize: 18,
                    color: signInStartColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        FontAwesomeIcons.creditCard,
                        color: signInEndColor,
                      ),
                      DropdownButton(
                          hint: Text(
                            'Choose Payment Method',
                            textAlign: TextAlign.center,
                          ),
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Text("PayPal"),
                              value: 1,
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Card Number :',
                  style: TextStyle(
                    fontSize: 18,
                    color: signInStartColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black38,
                    width: 1,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: _cardNumber,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Card Number'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Expiration Year :',
                  style: TextStyle(
                    fontSize: 18,
                    color: signInStartColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black38,
                    width: 1,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: _exp_year,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Expiration Year'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Expiration Month :',
                  style: TextStyle(
                    fontSize: 18,
                    color: signInStartColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black38,
                    width: 1,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: _exp_month,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Expiration Month'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'CVC',
                  style: TextStyle(
                    fontSize: 18,
                    color: signInStartColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black38,
                    width: 1,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      controller: _cvc,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'CVC'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Currency',
                  style: TextStyle(
                    fontSize: 18,
                    color: signInStartColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.money_outlined,
                        color: signInEndColor,
                      ),
                      DropdownButton(
                          hint: Text(
                            'Choose Payment Method',
                            textAlign: TextAlign.center,
                          ),
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Row(
                                children: [
                                  Text("SAR"),
                                ],
                              ),
                              value: 1,
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          }),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    cardNumber = _cardNumber.text.trim();
                    exp_month = _exp_month.text.trim();
                    exp_year = _exp_year.text.trim();
                    cvc = _cvc.text.trim();
                    HttpServices.checkout(cardNumber, exp_year, exp_month,
                            'PayPal', 'Sar', cvc, context)
                        .then((value) => null);
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: signInEndColor),
                    child: Center(
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
