import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/Manager/Manage.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/Address.dart';
import 'package:hodhod_mart/model/User.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';

import 'package:hodhod_mart/screens/my_account/account_information/account_information.dart';
import 'package:hodhod_mart/screens/my_account/updatePassword.dart';
import 'package:hodhod_mart/screens/my_orders/my_orders.dart';
import 'package:hodhod_mart/screens/start_page.dart';
import 'package:provider/provider.dart';

class MyAccountBody extends StatefulWidget {
  @override
  _MyAccountBodyState createState() => _MyAccountBodyState();
}

class _MyAccountBodyState extends State<MyAccountBody> {
  bool loading;
  User user;
  List<Address> addresses;

  @override
  void initState() {
    super.initState();
    loading = true;

    HttpServices.GetUserInfo(context).then((value) => {
          setState(() => {loading = false})
        });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<ModelsProvider>(context, listen: true).user;
    return SafeArea(
      bottom: true,
      child: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                            height: MediaQuery.of(context).size.height / 3.8,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
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
                                      child: user.image == null
                                          ? Image.asset(
                                              'assets/profile.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.network(
                                              baseUrl + user.image,
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                  ),
                                ),
                                Text(
                                  user.name,
                                  style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    user.email,
                                    style: TextStyle(
                                        color: kTextColor.withOpacity(0.5),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: OutlineButton(
                                  borderSide:
                                      BorderSide(color: signInStartColor),
                                  color: Color(0xFFc68cf3),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return AccountInfo();
                                    }));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'My Account',
                                        style:
                                            TextStyle(color: signInStartColor),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      SvgPicture.asset(
                                        "assets/svg/account_box-24px.svg",
                                        color: signInStartColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: OutlineButton(
                                  borderSide:
                                      BorderSide(color: signInStartColor),
                                  color: Color(0xFF838eff),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MyOrders();
                                        },
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'My Orders',
                                        style:
                                            TextStyle(color: signInStartColor),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      SvgPicture.asset(
                                        "assets/svg/check_box-24px (1).svg",
                                        color: signInStartColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: OutlineButton(
                                  borderSide:
                                      BorderSide(color: signInStartColor),
                                  color: Color(0xFF6cdca1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return UpDatePassword();
                                    }));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Change Password',
                                        style:
                                            TextStyle(color: signInStartColor),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svg/vpn_key-24px.svg',
                                        color: signInStartColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: OutlineButton(
                                  borderSide:
                                      BorderSide(color: signInStartColor),
                                  color: Color(0xFFf9c967),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Terms Of use',
                                        style:
                                            TextStyle(color: signInStartColor),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svg/content_paste-24px.svg',
                                        color: signInStartColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: OutlineButton(
                                  borderSide:
                                      BorderSide(color: signInStartColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Privacy Policy',
                                        style:
                                            TextStyle(color: signInStartColor),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svg/no_encryption-24px.svg',
                                        color: signInStartColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: OutlineButton(
                                  borderSide:
                                      BorderSide(color: signInStartColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  onPressed: () {
                                    setState(() {
                                      loading = true;
                                    });
                                    Manager.logout(context).then((value) =>
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return StartPage();
                                        })));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Logout',
                                        style:
                                            TextStyle(color: signInStartColor),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.logout,
                                        color: signInStartColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
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
