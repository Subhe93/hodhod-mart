import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';

class PaymentCheckout extends StatefulWidget {
  @override
  _PaymentCheckoutState createState() => _PaymentCheckoutState();
}

class _PaymentCheckoutState extends State<PaymentCheckout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: SingleChildScrollView (
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container (
              color: Colors.white,
              height: 150,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20 , right: 20 , top: 20),
              child: Column (
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How Do Tou Wish To Pay ?',
                    maxLines: 1,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row (
                        children: [
                          SvgPicture.asset('assets/svg/credit cart.svg',
                          width: 30,
                          height: 30,),
                          SizedBox(width: 10,),
                          Text ('Cash On Delivery'),
                        ],
                      ),
                      CircularCheckBox(
                        value: false,
                        onChanged: null,
                      ),
                    ],
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row (
                        children: [
                          SvgPicture.asset('assets/svg/money.svg',
                          width: 30,
                          height: 30,),
                          SizedBox(width: 10,),
                          Text ('Cash On Delivery'),
                        ],
                      ),
                      CircularCheckBox(
                        value: true,
                        onChanged: null,
                        focusColor: Colors.amber,
                        disabledColor: Colors.amber,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 320,
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top : 10),
              padding: EdgeInsets.fromLTRB(20 , 20 , 20 , 0),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'CREDIT CARD DETAILS',
                    maxLines: 1,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container (
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(0 , 20 , 0 , 15),
                    decoration: BoxDecoration (
                        border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                    ),
                    child : Padding(
                      padding: const EdgeInsets.fromLTRB(10 , 10 , 0 , 0),
                      child: Text (
                        'Card Type',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle (
                          fontSize: 14,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                  Container (
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(0 , 0 , 0 , 15),
                    decoration: BoxDecoration (
                        border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                    ),
                    child : Padding(
                      padding: const EdgeInsets.fromLTRB(10 , 10 , 0 , 0),
                      child: Text (
                        'Card Number',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle (
                          fontSize: 14,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                  Container (
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(0 , 0 , 0 , 10),
                    decoration: BoxDecoration (
                        border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                    ),
                    child : Padding(
                      padding: const EdgeInsets.fromLTRB(10 , 10 , 0 , 0),
                      child: Text (
                        'Name On Card',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle (
                          fontSize: 14,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container (
                        height: 40,
                        width: (MediaQuery.of(context).size.width / 2 ) - 30,
                        margin: EdgeInsets.fromLTRB(0 , 0 , 0 , 10),
                        decoration: BoxDecoration (
                            border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                        ),
                        child : Padding(
                          padding: const EdgeInsets.fromLTRB(10 , 10 , 0 , 0),
                          child: Text (
                            'Expiry Date',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle (
                              fontSize: 14,
                              color: kTextColor,
                            ),
                          ),
                        ),
                      ),
                      Container (
                        height: 40,
                        width: (MediaQuery.of(context).size.width / 2 ) - 30,
                        margin: EdgeInsets.fromLTRB(0 , 0 , 0 , 10),
                        decoration: BoxDecoration (
                            border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1)
                        ),
                        child : Padding(
                          padding: const EdgeInsets.fromLTRB(10 , 10 , 0 , 0),
                          child: Text (
                            'CCV',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle (
                              fontSize: 14,
                              color: kTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text (
                          'Save My Card Details'),
                      Switch(
                        value: true, onChanged: null,
                        inactiveThumbColor: Colors.green,),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom : 10.0),
              child: Container (
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(20),
                height: 260,
                width: MediaQuery.of(context).size.width,
                color : Colors.white,
                child: Column (
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Column (
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top : 10.0 , bottom: 10),
                          child: Row (
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/svg/mail.svg',
                                color: Colors.amber,
                                width: 30,
                                height: 30,),
                              Padding(
                                padding: const EdgeInsets.only(left : 15.0),
                                child: Text ('Email'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top : 0 , bottom: 10),
                          child: Row (
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/svg/phone.svg',
                                color: Colors.blueAccent,
                                width: 30,
                                height: 30,),
                              Padding(
                                padding: const EdgeInsets.only(left : 15.0),
                                child: Text ('Phone'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top : 8.0),
                          child: Text (
                            'dsjhfsdjdsfhjsdfj hdfj jskdfh d fgksg fkdsj fgskfk sgjf ksd fkjdsjgfs dkjfgds fdskgf ksjdgf kjsdgf kjsdf gsjd fkjsgd fkjsg fjkgjsdf gkjsgdjfg jksdgf sdjkfgkdgsjf skdgfk dsgfsd',
                            maxLines: 5,
                            style: TextStyle (
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:kTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
