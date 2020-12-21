import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/Manager/Manager.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:hodhod_mart/screens/homePage/components/bottom_app_bar.dart';

import 'package:provider/provider.dart';
import 'dart:io';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool loading;
  @override
  void initState() {
    loading = true;
    super.initState();
    Manager.getToken().then((value) =>
        {Provider.of<ModelsProvider>(context, listen: false).setToken(value)});
    Manager.checkInternet(context);
    HttpServices.getHomeData(context).then((value) => {
          if (mounted)
            {
              if (value)
                {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeBottomBar();
                    },
                  )),
                }
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset(
                        'assets/svg/HodHod Mart Final Logo.svg',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Theme(
                              data: ThemeData(
                                accentColor: signInEndColor,
                              ),
                              child: Provider.of<ModelsProvider>(context,
                                          listen: true)
                                      .internetAccess
                                  ? CircularProgressIndicator()
                                  : noConnection(Manager.checkInternet(context)
                                      .then((value) => {
                                            if (value)
                                              {
                                                setState(() => {
                                                      loading = true,
                                                      HttpServices.getHomeData(
                                                              context)
                                                          .then((value) => {
                                                                if (mounted)
                                                                  {
                                                                    if (value)
                                                                      {
                                                                        Navigator.pushReplacement(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                          builder:
                                                                              (context) {
                                                                            return HomeBottomBar();
                                                                          },
                                                                        )),
                                                                      }
                                                                  }
                                                              })
                                                    })
                                              }
                                          }))),
                        )
                        // FlatButton(
                        //   onPressed: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) {
                        //           return SignIn();
                        //         },
                        //       ),
                        //     );
                        //   },
                        //   child: Container(
                        //     height: 50,
                        //     width: MediaQuery.of(context).size.width * 0.8,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(25),
                        //       color: Colors.yellow,
                        //       gradient: LinearGradient(
                        //         begin: const FractionalOffset(0.0, 0.0),
                        //         end: const FractionalOffset(1.7, 0.0),
                        //         colors: [signInStartColor, signInEndColor],
                        //       ),
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         'Sign In',
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // FlatButton(
                        //   onPressed: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) {
                        //           return CareateAccount();
                        //         },
                        //       ),
                        //     );
                        //   },
                        //   child: Container(
                        //     height: 50,
                        //     width: MediaQuery.of(context).size.width * 0.8,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(25),
                        //       color: Colors.yellow,
                        //       gradient: LinearGradient(
                        //         begin: const FractionalOffset(0.0, 0.0),
                        //         end: const FractionalOffset(1.7, 0.0),
                        //         colors: [signInStartColor, signInEndColor],
                        //       ),
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         'Create Account',
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.03,
                        // ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       height: 1,
                        //       width: MediaQuery.of(context).size.width * 0.32,
                        //       decoration: BoxDecoration(
                        //         color: Colors.grey,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 20,
                        //     ),
                        //     Text(
                        //       'or',
                        //       style: TextStyle(
                        //         color: Color(0xFFA83835),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 20,
                        //     ),
                        //     Container(
                        //       height: 1,
                        //       width: MediaQuery.of(context).size.width * 0.32,
                        //       decoration: BoxDecoration(
                        //         color: Colors.grey,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.01,
                        // ),
                        // Center(
                        //   child: Text(
                        //     'Sign in with Facebook & Instagram',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //       color: kTextColor,
                        //       fontSize: 13,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.03,
                        // ),
                        // FlatButton(
                        //   onPressed: () {},
                        //   child: Container(
                        //     height: 50,
                        //     width: MediaQuery.of(context).size.width * 0.8,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(25),
                        //       // color: Colors.yellow,
                        //     ),
                        //     child: SignInButton(
                        //       Buttons.Facebook,
                        //       onPressed: () async {},
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(25),
                        //       ),
                        //     ),
                        //     // Center(
                        //     //   child: Row(
                        //     //     children: [
                        //     //       Text(
                        //     //         'Sign In with Facebook',
                        //     //         style: TextStyle(
                        //     //           color: Colors.white,
                        //     //           fontWeight: FontWeight.bold,
                        //     //         ),
                        //     //       ),
                        //     //     ],
                        //     //   ),
                        //     // ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.03,
                        // ),
                        // FlatButton(
                        //   onPressed: () {},
                        //   child: Container(
                        //     height: 50,
                        //     width: MediaQuery.of(context).size.width * 0.8,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(25),
                        //         border: Border.all(color: instaTextColor)),
                        //     child: Center(
                        //       child: Text(
                        //         'Sign In with Instagram',
                        //         style: TextStyle(
                        //           color: instaTextColor,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 50,
                        // )
                        )
                  ],
                ),
              )
            : HomeBottomBar());
  }
}

Widget noConnection(Future request) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Icon(
          Icons.wifi_off,
          size: 40,
          color: signInStartColor,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 300,
          child: Text(
            'No internet access please connect to the internet and try again!',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            request;
          },
          child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [signInEndColor, signInStartColor])),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Try Again',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
        )
      ],
    ),
  );
}
