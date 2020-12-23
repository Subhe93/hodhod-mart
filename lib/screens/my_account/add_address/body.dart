import 'package:flutter/material.dart';
import 'package:hodhod_mart/Manager/Manager.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/model/Address.dart';
import 'package:hodhod_mart/model/User.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class AddAddressBody extends StatefulWidget {
  @override
  _AddAddressBodyState createState() => _AddAddressBodyState();
}

class _AddAddressBodyState extends State<AddAddressBody> {
  bool loading;
  String address1;
  String address2;
  String city;
  String state;
  String zipCode;
  String country;
  String fullname;
  String phoneNumber;
  User user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = false;
  }

  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    user = Provider.of<ModelsProvider>(context, listen: true).user;
    return Scaffold(
      body: SafeArea(
          bottom: true,
          top: false,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Applocalizations.of(context)
                                  .translate("Shipping Address"),
                              maxLines: 1,
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
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
                                padding: const EdgeInsets.all(2.0),
                                child: TextFormField(
                                  controller: _address1,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.home,
                                        color: signInStartColor,
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Address Line 1'),
                                ),
                              ),
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
                                padding: const EdgeInsets.all(2.0),
                                child: TextFormField(
                                  controller: _address2,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.home,
                                        color: signInStartColor,
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Address Line 2'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.black38,
                                      width: 1,
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: TextFormField(
                                        controller: _city,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.pin_drop,
                                            color: signInStartColor,
                                          ),
                                          border: InputBorder.none,
                                          hintText: Applocalizations.of(context)
                                              .translate("City"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.black38,
                                      width: 1,
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: TextFormField(
                                        controller: _state,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.location_city_sharp,
                                              color: signInStartColor,
                                            ),
                                            border: InputBorder.none,
                                            hintText:
                                                Applocalizations.of(context)
                                                    .translate("State")),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.black38,
                                      width: 1,
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: TextFormField(
                                        controller: _country,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.flag,
                                              color: signInStartColor,
                                            ),
                                            border: InputBorder.none,
                                            hintText:
                                                Applocalizations.of(context)
                                                    .translate("Country")),
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
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    Applocalizations.of(context)
                                        .translate("Contact Informaion"),
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
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
                                      padding: const EdgeInsets.all(2.0),
                                      child: TextFormField(
                                        controller: _fullName,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: signInStartColor,
                                            ),
                                            border: InputBorder.none,
                                            hintText: Applocalizations.of(
                                                    context)
                                                .translate(
                                                    "Enter Your First Name - Last Name")),
                                      ),
                                    ),
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
                                      padding: const EdgeInsets.all(2.0),
                                      child: TextFormField(
                                        controller: _phoneNumber,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.phone,
                                              color: signInStartColor,
                                            ),
                                            border: InputBorder.none,
                                            hintText: Applocalizations.of(
                                                    context)
                                                .translate(
                                                    "Enter Your Phone Number")),
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
              ),
              loading
                  ? Center(child: CircularProgressIndicator())
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () => {
                          address1 = _address1.text.trim(),
                          address2 = _address2.text.trim(),
                          city = _city.text.trim(),
                          state = _state.text.trim(),
                          fullname = _fullName.text.trim(),
                          phoneNumber = _phoneNumber.text.trim(),
                          country = _country.text.trim(),
                          if (address1.isEmpty ||
                              address2.isEmpty ||
                              city.isEmpty ||
                              state.isEmpty ||
                              fullname.isEmpty ||
                              phoneNumber.isEmpty)
                            {
                              Manager.toastMessage(
                                  Applocalizations.of(context)
                                      .translate("Empty Fields"),
                                  signInStartColor)
                            }
                          else
                            {
                              setState(() => {loading = true}),
                              HttpServices.addAddress(
                                      context,
                                      address1,
                                      address2,
                                      city,
                                      fullname,
                                      phoneNumber,
                                      state,
                                      " user.email",
                                      country)
                                  .then((done) => {
                                        if (done)
                                          {
                                            Provider.of<ModelsProvider>(context,
                                                    listen: false)
                                                .addAddress(Address(
                                                    fullName: fullname,
                                                    addressLine1: address1,
                                                    addressLine2: address2,
                                                    state: state,
                                                    city: city,
                                                    country: country)),
                                            Navigator.pop(context),
                                          }
                                      })
                            }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          color: Colors.deepPurple,
                          child: Center(
                              child: Text(
                            Applocalizations.of(context)
                                .translate("Add Address"),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )),
                        ),
                      ),
                    )
            ],
          )),
    );
  }
}
