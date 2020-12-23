import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hodhod_mart/Manager/Manager.dart';

import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';

import 'component/app_bar.dart';

class UpDatePassword extends StatelessWidget {
  String password;
  String confirmPassword;

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: accountAppBar(context, true,
          Applocalizations.of(context).translate("Profile"), false),
      body: Stack(
        children: [
          InkWell(
            onTap: () => {
              password = _password.text.trim(),
              confirmPassword = _confirmPassword.text.trim(),
              if (password.isEmpty || confirmPassword.isEmpty)
                {
                  Manager.toastMessage(
                      Applocalizations.of(context).translate("Empty Fields"),
                      Colors.red)
                }
              else
                {
                  if (password == confirmPassword)
                    {
                      HttpServices.updatePassword(context, password).then(
                          (success) => success
                              ? Manager.toastMessage(
                                  Applocalizations.of(context)
                                      .translate("Password changed"),
                                  Colors.green)
                              : Manager.toastMessage(
                                  Applocalizations.of(context)
                                      .translate("Something went wrong"),
                                  Colors.grey))
                    }
                  else
                    {
                      Manager.toastMessage(
                          Applocalizations.of(context)
                              .translate("Password Mismatch"),
                          signInStartColor)
                    }
                }
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.deepPurple,
                child: Center(
                    child: Text(
                  Applocalizations.of(context).translate("Update Password"),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Applocalizations.of(context).translate("Update Password"),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                          controller: _password,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                FontAwesomeIcons.lock,
                                color: signInStartColor,
                              ),
                              border: InputBorder.none,
                              hintText: Applocalizations.of(context)
                                  .translate("New Password")),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
                          controller: _confirmPassword,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                FontAwesomeIcons.lock,
                                color: signInStartColor,
                              ),
                              border: InputBorder.none,
                              hintText: Applocalizations.of(context)
                                  .translate("Confirm Password")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
