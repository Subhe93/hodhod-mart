import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/screens/homePage/components/bottom_app_bar.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top : 80.0 , bottom: 20),
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text ('Sign In',
                      style: TextStyle (
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      ),
                      SizedBox (height: MediaQuery.of(context).size.height * 0.1,),
                      Text ('Enter your mobile number',
                        style: TextStyle (
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox (height: MediaQuery.of(context).size.height * 0.05,),
                      Container (
                        padding: EdgeInsets.only(left: 10 , right: 5),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: greyBorder),
                        ),
                        child: Row (
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon (
                              Icons.arrow_drop_down,
                            size: 20,
                            color: Colors.red,),
                            CountryCodePicker (),
                            SizedBox (width: 10,),
                            SizedBox (
                              child: Container (
                                width: 2,
                                height: 30,
                                color: greyBorder,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox (height: MediaQuery.of(context).size.height * 0.05,),
                      Padding(
                        padding: const EdgeInsets.only(left : 15.0 , right: 15),
                        child: Center (
                          child: RichText(
                            text : TextSpan (
                              children: [
                                TextSpan (
                                  text : 'By creating an account you agree to our ',
                                  style: TextStyle (
                                    color: kTextColor,
                                    fontSize: textSize,
                                  ),
                                ),
                                TextSpan (
                                  text: 'Terms ',
                                  style: TextStyle (
                                    color: kTextPurpleColor,
                                    fontSize: textSize,
                                  ),
                                ),
                                TextSpan (
                                  text : 'of ',
                                  style: TextStyle (
                                    color: kTextColor,
                                    fontSize: textSize,
                                  ),
                                ),
                                TextSpan (
                                  text : 'Service ',
                                  style: TextStyle (
                                    color: kTextPurpleColor,
                                    fontSize: textSize,
                                  ),
                                ),
                                TextSpan (
                                  text : 'and ',
                                  style: TextStyle (
                                    color: kTextColor,
                                    fontSize: textSize,
                                  ),
                                ),
                                TextSpan (
                                  text : 'Privacy Policy',
                                  style: TextStyle (
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
                      SizedBox (height: MediaQuery.of(context).size.height * 0.05,),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeBottomBar();
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.yellow,
                          ),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient (
                                colors: [
                                  signInStartColor ,
                                  signInEndColor
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.7, 0.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container (
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.32,
                            decoration: BoxDecoration (
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox (width: 20,),
                          Text(
                            'or',
                            style: TextStyle (
                              color: Color(0xFFA83835),
                            ),),
                          SizedBox (width: 20,),
                          Container (
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.32,
                            decoration: BoxDecoration (
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Center (
                        child: Text (
                            'Sign in with Facebook & Instagram',
                          textAlign: TextAlign.center,
                          style: TextStyle (
                            color: kTextColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      FlatButton(
                        onPressed: () {
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            // color: Colors.yellow,
                          ),
                          child: SignInButton(
                            Buttons.Facebook,
                            onPressed: () {

                            },
                            shape: RoundedRectangleBorder (
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          // Center(
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         'Sign In with Facebook',
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: instaTextColor)
                          ),
                          child: Center(
                            child: Text(
                              'Sign In with Instagram',
                              style: TextStyle(
                                color: instaTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
      ),
    );
  }
}
