import 'package:flutter/material.dart';
import 'package:hodhod_mart/Manager/Manage.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/screens/homePage/components/bottom_app_bar.dart';
import 'package:hodhod_mart/screens/start_page.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../constants.dart';

class CareateAccount extends StatefulWidget {
  @override
  _CareateAccountState createState() => _CareateAccountState();
}

class _CareateAccountState extends State<CareateAccount> {
  bool isLoading;
  String phone;
  String email;
  String password;
  String confirmPassword;
  String firstName;
  String lastName;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        isLoading
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.black38.withAlpha(100)),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Create Acount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      controller: firstNameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12, right: 12),
                          border: InputBorder.none,
                          hintText: 'First Name'),
                    ),
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
                      controller: lastNameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12, right: 12),
                          border: InputBorder.none,
                          hintText: 'Last Name'),
                    ),
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
                      controller: emailController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12, right: 12),
                          border: InputBorder.none,
                          hintText: 'Email'),
                    ),
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
                    padding: const EdgeInsets.only(left: 13),
                    child: InternationalPhoneNumberInput(
                        inputBorder: InputBorder.none,
                        onInputChanged: (value) => {phone = value.toString()}),
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
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12, right: 12),
                          border: InputBorder.none,
                          hintText: 'Password'),
                    ),
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
                  child: TextFormField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 12, right: 12),
                        border: InputBorder.none,
                        hintText: 'Confirm Password'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: () {
                    password = passwordController.text.trim();
                    email = emailController.text.trim();
                    firstName = firstNameController.text.trim();
                    lastName = lastNameController.text.trim();
                    confirmPassword = confirmPasswordController.text.trim();

                    if (password.isEmpty ||
                        email.isEmpty ||
                        firstName.isEmpty ||
                        confirmPassword.isEmpty ||
                        lastName.isEmpty) {
                      Manager.toastMessage('Empty Fields', Colors.grey);
                      return;
                    }
                    if (password != confirmPassword) {
                      Manager.toastMessage('Password Mismatch', Colors.grey);
                      return;
                    }
                    setState(() => {isLoading = true});
                    HttpServices.createAccount(password, email, firstName,
                            lastName, phone, context)
                        .then((value) => {
                              setState(() => {isLoading = false}),
                              if (value == 200)
                                {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return StartPage();
                                      },
                                    ),
                                  )
                                }
                            });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.yellow,
                      gradient: LinearGradient(
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.7, 0.0),
                        colors: [signInStartColor, signInEndColor],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Create',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'By creating an account you agree to our ',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: textSize,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms ',
                            style: TextStyle(
                              color: kTextPurpleColor,
                              fontSize: textSize,
                            ),
                          ),
                          TextSpan(
                            text: 'of ',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: textSize,
                            ),
                          ),
                          TextSpan(
                            text: 'Service ',
                            style: TextStyle(
                              color: kTextPurpleColor,
                              fontSize: textSize,
                            ),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: textSize,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: kTextPurpleColor,
                              fontSize: textSize,
                            ),
                          ),
                        ],
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
