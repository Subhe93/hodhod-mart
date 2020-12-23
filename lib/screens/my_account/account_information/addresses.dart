import 'package:flutter/material.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/model/Address.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/screens/my_account/add_address/add_address.dart';

import '../../../constants.dart';

class AddressesWidget extends StatefulWidget {
  const AddressesWidget({
    Key key,
    @required this.addresses,
  }) : super(key: key);

  final List<Address> addresses;

  @override
  _AddressesWidgetState createState() => _AddressesWidgetState();
}

class _AddressesWidgetState extends State<AddressesWidget> {
  bool loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 300,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Applocalizations.of(context).translate("Addresses"),
                  maxLines: 1,
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Container(
                //   width: 60,
                //   height: 25,
                //   child: FlatButton(
                //     color: Colors.redAccent,
                //     onPressed: () {

                //     },
                //     child: Center(
                //         child: Text(
                //       'Edit',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.normal,
                //         fontSize: 14,
                //       ),
                //     )),
                //   ),
                // )
              ],
            ),
            loading
                ? Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 1,
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Address Line 1 :' +
                                                widget.addresses[index]
                                                    .addressLine1,
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: signInStartColor),
                                          ),
                                          Text(
                                              'Address Line 2 :' +
                                                  widget
                                                      .addresses[index].country,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: signInStartColor)),
                                          Text(Applocalizations.of(context)
                                                  .translate("City :") +
                                              widget.addresses[index].city),
                                          Text(Applocalizations.of(context)
                                                  .translate("Country:") +
                                              widget.addresses[index].country)
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () => {
                                                  setState(
                                                      () => loading = true),
                                                  HttpServices.deleteAddress(
                                                          widget
                                                              .addresses[index]
                                                              .id,
                                                          context)
                                                      .then((value) => {
                                                            if (value == true)
                                                              {
                                                                widget.addresses
                                                                    .removeAt(
                                                                        index),
                                                              },
                                                            setState(() =>
                                                                loading = false)
                                                          })
                                                },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          itemCount: widget.addresses.length,
                        ),
                      ),
                    ),
                  ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddAddress();
                  }));
                },
                child: Text(
                  Applocalizations.of(context).translate("Add New Address"),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
