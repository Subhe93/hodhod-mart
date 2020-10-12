import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/screens/my_account/account_information/account_information.dart';
import 'package:hodhod_mart/screens/my_orders/my_orders.dart';

class MyAccountBody extends StatefulWidget {
  @override
  _MyAccountBodyState createState() => _MyAccountBodyState();
}

class _MyAccountBodyState extends State<MyAccountBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        color: Colors.white54.withOpacity(0.5),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 5.0,
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(70),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(70),
                                child: Image.asset(
                                  'assets/profile.png',
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'HodHod Mart',
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'HodHodMart@gmail.com',
                              style: TextStyle(
                                  color: kTextColor.withOpacity(0.5),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 360,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return AccountInfo ();
                                    }));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFFc68cf3),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SvgPicture.asset(
                                            'assets/svg/account.svg',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'My Account',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: kTextColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MyOrders();
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFF838eff),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SvgPicture.asset(
                                            'assets/svg/order.svg',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'My Order',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: kTextColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFF6cdca1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SvgPicture.asset(
                                            'assets/svg/pass.svg',
                                            width: 10,
                                            height: 10,
                                            allowDrawingOutsideViewBox: false,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 90,
                                        child: Text(
                                          'Password Change',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: kTextColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFFf9c967),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SvgPicture.asset(
                                            'assets/svg/terms use.svg',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Terms Use',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: kTextColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFFfd6073),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SvgPicture.asset(
                                            'assets/svg/privcy.svg',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 90,
                                        child: Text(
                                          'Privacy Policy',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: kTextColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFF64cbf6),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SvgPicture.asset(
                                            'assets/svg/faqs.svg',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'FAQ\'s',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: kTextColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.deepPurple,
              child: Center(
                  child: Text(
                'SHARE THE APP',
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
    );
  }
}
