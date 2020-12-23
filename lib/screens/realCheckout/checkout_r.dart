import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hodhod_mart/Manager/Manager.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/model/Address.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/my_account/add_address/add_address.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String cardNumber;
  String exp_year;
  String cvc;
  String exp_month;
  var _address;
  var _paymentValue;
  var _monthValue;
  var _currencyValue;
  var _yearValue;
  bool loading;
  List<Address> addresses;
  List<DropdownMenuItem> years;
  List<DropdownMenuItem> userAddress;
  @override
  void initState() {
    super.initState();
    userAddress = [];
    years = [];
    addresses = [];
    loading = true;
    for (var i = 0; i < 10; i++) {
      years.add(DropdownMenuItem(
        child: Text('${2020 + i}'),
        value: i,
      ));
    }
    HttpServices.getUserAddress(context).then((value) => {
          setState(() => {
                loading = false,
                addresses = value,
                for (var i = 0; i < addresses.length; i++)
                  {
                    userAddress.add(DropdownMenuItem(
                      child: Text(addresses[i].addressLine1),
                      value: i + 1,
                    ))
                  }
              })
        });
    _yearValue = 1;
    _monthValue = 1;
    _paymentValue = 1;
    _currencyValue = 1;
    _address = 1;
  }

  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _cvc = TextEditingController();
  final TextEditingController _exp_month = TextEditingController();
  final TextEditingController _exp_year = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(
          false, false, context, false, 'HOD HOD MART', searchAction(context)),
      body: SafeArea(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(14.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Applocalizations.of(context).translate("Checkout"),
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
                        Applocalizations.of(context)
                            .translate("Payment Method:"),
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
                                  Applocalizations.of(context)
                                      .translate("Choose Payment Method"),
                                  textAlign: TextAlign.center,
                                ),
                                value: _paymentValue,
                                items: [
                                  DropdownMenuItem(
                                    child: Text(Applocalizations.of(context)
                                        .translate("Credit Card")),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(Applocalizations.of(context)
                                        .translate("Cash on delivery")),
                                    value: 2,
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _paymentValue = value;
                                  });
                                }),
                          ],
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Applocalizations.of(context).translate("Address :"),
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
                          addresses.isEmpty
                              ? InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return AddAddress();
                                        },
                                      ),
                                    ).then((value) => {
                                          HttpServices.getUserAddress(context)
                                              .then((value) => {
                                                    setState(() => {
                                                          loading = false,
                                                          addresses = value,
                                                          for (var i = 0;
                                                              i <
                                                                  addresses
                                                                      .length;
                                                              i++)
                                                            {
                                                              userAddress.add(
                                                                  DropdownMenuItem(
                                                                child: Text(
                                                                    addresses[i]
                                                                        .addressLine1),
                                                                value: i + 1,
                                                              ))
                                                            }
                                                        })
                                                  })
                                        });
                                  },
                                  child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: signInEndColor)),
                                      child: Center(
                                        child: Text(
                                          Applocalizations.of(context).translate(
                                              "Your Addresses are empty Press to Add Address"),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                          value: _address,
                                          items: userAddress,
                                          onChanged: (value) {
                                            setState(() {
                                              _paymentValue = _address;
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        Applocalizations.of(context).translate("Card Number :"),
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
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: Applocalizations.of(context)
                                    .translate("Card Number")),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Text(
                      //   'Expiration Year :',
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     color: signInStartColor,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      //   textAlign: TextAlign.start,
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //       border: Border.all(
                      //     color: Colors.black38,
                      //     width: 1,
                      //   )),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 20.0),
                      //     child: TextFormField(
                      //       controller: _exp_year,
                      //       keyboardType: TextInputType.number,
                      //       inputFormatters: <TextInputFormatter>[
                      //         WhitelistingTextInputFormatter.digitsOnly
                      //       ],
                      //       decoration: InputDecoration(
                      //           border: InputBorder.none,
                      //           hintText: 'Expiration Year '),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
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
                        Applocalizations.of(context)
                            .translate("Expiration Year :"),
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
                            DropdownButton(
                                hint: Text(
                                  'Expiration Year',
                                  textAlign: TextAlign.center,
                                ),
                                value: _yearValue,
                                items: years,
                                onChanged: (value) {
                                  setState(() {
                                    _yearValue = value;
                                  });
                                }),
                          ],
                        ),
                      ),
                      Text(
                        Applocalizations.of(context)
                            .translate("Expiration Month :"),
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
                      // Container(
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //       border: Border.all(
                      //     color: Colors.black38,
                      //     width: 1,
                      //   )),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 20.0),
                      //     child: TextFormField(
                      //       controller: _exp_month,
                      //       decoration: InputDecoration(
                      //           border: InputBorder.none,
                      //           hintText: 'Expiration Month number'),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DropdownButton(
                                hint: Text(
                                  Applocalizations.of(context)
                                      .translate("Expiration Month :"),
                                  textAlign: TextAlign.center,
                                ),
                                value: _monthValue,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("1"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("2"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("3"),
                                    value: 3,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("4"),
                                    value: 4,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("5"),
                                    value: 5,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("6"),
                                    value: 6,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("7"),
                                    value: 7,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("8"),
                                    value: 8,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("9"),
                                    value: 9,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("10"),
                                    value: 10,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("11"),
                                    value: 11,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("12"),
                                    value: 12,
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _monthValue = value;
                                  });
                                }),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Applocalizations.of(context).translate("Currency"),
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
                                value: _currencyValue,
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
                                    _currencyValue = value;
                                  });
                                }),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cardNumber = _cardNumber.text.trim();
                          cvc = _cvc.text.trim();

                          if (cvc == "" || cardNumber == "") {
                            Manager.toastMessage(
                                Applocalizations.of(context)
                                    .translate("Empty Fields"),
                                Colors.red);
                            return;
                          }
                          if (cardNumber.length != 16) {
                            Manager.toastMessage(
                                Applocalizations.of(context).translate(
                                    "Card Number must be 24 charecter long"),
                                Colors.red);
                            return;
                          }
                          setState(() => {loading = true});
                          HttpServices.checkout(
                                  cardNumber,
                                  '${_yearValue + 2020}',
                                  _monthValue.toString(),
                                  'PayPal',
                                  'Sar',
                                  cvc,
                                  context)
                              .then((value) => {
                                    setState(() => {loading = false}),
                                    if (value)
                                      {
                                        Provider.of<ModelsProvider>(context,
                                                listen: false)
                                            .setCartItems([]),
                                        Navigator.pop(context)
                                      }
                                  });
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: signInEndColor),
                          child: Center(
                            child: Text(
                              Applocalizations.of(context)
                                  .translate("Checkout"),
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
