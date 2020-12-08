import 'dart:io';

import 'package:hodhod_mart/Manager/Manager.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/User.dart';

class EditAccountInfoBody extends StatefulWidget {
  final User user;

  const EditAccountInfoBody({Key key, this.user}) : super(key: key);
  @override
  _EditAccountInfoBodyState createState() => _EditAccountInfoBodyState();
}

class _EditAccountInfoBodyState extends State<EditAccountInfoBody> {
  String _name;
  String _lastname;
  String _email;
  String _phone;
  bool loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = false;
    firstName.text = widget.user.name;
    lastName.text = widget.user.lastName;
    emailController.text = widget.user.email;
    _phone = widget.user.phoneNumber;
  }

  final TextEditingController emailController = TextEditingController();

  final TextEditingController firstName = TextEditingController();

  final TextEditingController lastName = TextEditingController();
  final TextEditingController phone = TextEditingController();

  File _image;

  Future presentImagePicker() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      File selected = File(image.path);
      _image = selected;
      HttpServices.updateProfileImage(_image, context)
          .then((done) => HttpServices.GetUserInfo(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        top: false,
        child: Stack(
          children: [
            InkWell(
              onTap: () => {
                _name = firstName.text.trim(),
                _lastname = lastName.text.trim(),
                if (_name.isEmpty || _lastname.isEmpty)
                  {Manager.toastMessage('Empty Fields', Colors.red)}
                else
                  {
                    setState(() => loading = true),
                    HttpServices.updateUser(
                      context,
                      _name,
                      _lastname,
                    ).then((done) => {
                          if (done)
                            {
                              HttpServices.GetUserInfo(context).then((value) =>
                                  HttpServices.GetUserInfo(context)
                                      .then((value) => Navigator.pop(context)))
                            }
                        })
                  }
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  color: Colors.deepPurple,
                  child: Center(
                      child: Text(
                    'UPDATE ACCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => presentImagePicker(),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10),
                                child: Container(
                                  width: 180,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: InkWell(
                                          onTap: () => presentImagePicker(),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(1.0, 1.0),
                                                  blurRadius: 5.0,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  spreadRadius: 1.0,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(70),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(70),
                                              child: _image == null
                                                  ? Image.network(
                                                      baseUrl +
                                                          widget.user.image,
                                                      width: 120,
                                                      height: 120,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : Image.file(
                                                      _image,
                                                      width: 120,
                                                      height: 120,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 50,
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.all(4),
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.redAccent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: SvgPicture.asset(
                                                    'assets/svg/aperture.svg',
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              widget.user.name + ' ' + widget.user.lastName,
                              style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                widget.user.email,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'INFORMATION',
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: Colors.black38,
                                          width: 1,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: TextFormField(
                                        controller: firstName,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: signInStartColor,
                                            ),
                                            border: InputBorder.none,
                                            hintText: widget.user.name),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: Colors.black38,
                                          width: 1,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: TextFormField(
                                        controller: lastName,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: signInStartColor,
                                            ),
                                            border: InputBorder.none,
                                            hintText: widget.user.lastName),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: Colors.black38,
                                          width: 1,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.alternate_email,
                                              color: signInStartColor,
                                            ),
                                            border: InputBorder.none,
                                            hintText: widget.user.email),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Container(
                                  //   height: 50,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(25),
                                  //       border: Border.all(
                                  //         color: Colors.black38,
                                  //         width: 1,
                                  //       )),
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(2.0),
                                  //     child: TextFormField(
                                  //       controller: city,
                                  //       decoration: InputDecoration(
                                  //           prefixIcon: Icon(
                                  //             Icons.location_city,
                                  //             color: signInStartColor,
                                  //           ),
                                  //           border: InputBorder.none,
                                  //           hintText: 'city'),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Container(
                                  //   height: 50,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(25),
                                  //       border: Border.all(
                                  //         color: Colors.black38,
                                  //         width: 1,
                                  //       )),
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(2.0),
                                  //     child: TextFormField(
                                  //       controller: country,
                                  //       decoration: InputDecoration(
                                  //           prefixIcon: Icon(
                                  //             Icons.home,
                                  //             color: signInStartColor,
                                  //           ),
                                  //           border: InputBorder.none,
                                  //           hintText: 'Country'),
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 100,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            loading
                ? Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
          ],
        ));
  }
}
