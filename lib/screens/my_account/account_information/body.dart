import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/model/Address.dart';
import 'package:hodhod_mart/model/User.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:hodhod_mart/screens/my_account/add_address/add_address.dart';
import 'package:hodhod_mart/screens/my_account/edit_account_info/edit_account_info.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import 'addresses.dart';

class AccountInfoBody extends StatefulWidget {
  const AccountInfoBody({Key key}) : super(key: key);
  @override
  _AccountInfoBodyState createState() => _AccountInfoBodyState();
}

class _AccountInfoBodyState extends State<AccountInfoBody> {
  @override
  Widget build(BuildContext context) {
    List<Address> addresses =
        Provider.of<ModelsProvider>(context, listen: true).addresses;
    User user = Provider.of<ModelsProvider>(context, listen: true).user;
    return SafeArea(
      bottom: true,
      top: false,
      child: Column(
        children: [
          Container(
            color: Colors.white,
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
                        child: user.image == null
                            ? Image.asset(
                                'assets/profile.png',
                                width: 80,
                                height: 80,
                                fit: BoxFit.fill,
                              )
                            : CachedNetworkImage(
                                width: 80,
                                height: 80,
                                fit: BoxFit.fill,
                                imageUrl: baseUrl + user.image,
                                placeholder: (context, url) => Container(
                                  height: 20,
                                  width: 20,
                                  child: LoadingIndicator(
                                    indicatorType: Indicator.ballScale,
                                    color: signInEndColor,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )

                        // Image.network(
                        //     baseUrl + user.image,
                        //     width: 80,
                        //     height: 80,
                        //     fit: BoxFit.fill,
                        //   ),
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
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    user.email,
                    style: TextStyle(
                        color: kTextColor.withOpacity(0.5),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: 75,
                  height: 30,
                  child: FlatButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditAccountInfo(user: user);
                      }));
                    },
                    child: Center(
                        child: Text(
                      Applocalizations.of(context).translate("Edit"),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Applocalizations.of(context).translate("Info"),
                              maxLines: 1,
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  user.name,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kTextColor,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  user.lastName,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kTextColor,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  user.email,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AddressesWidget(addresses: addresses),
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 50,
          //   color: Colors.deepPurple,
          //   child: Center(
          //       child: Text(
          //     'DELETE ACCOUNT',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 16,
          //     ),
          //   )),
          // ),
        ],
      ),
    );
  }
}
