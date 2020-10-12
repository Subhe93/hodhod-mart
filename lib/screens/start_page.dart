import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/screens/signIn.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Container(
            padding: EdgeInsets.all(25),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset('assets/svg/HodHod Mart Final Logo.svg',
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignIn();
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
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
            height: MediaQuery.of(context).size.height * 0.03,
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
    );
  }
}
