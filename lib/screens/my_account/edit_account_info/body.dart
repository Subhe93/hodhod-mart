import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';

class EditAccountInfoBody extends StatefulWidget {
  @override
  _EditAccountInfoBodyState createState() => _EditAccountInfoBodyState();
}

class _EditAccountInfoBodyState extends State<EditAccountInfoBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Container(
                      width: 180,
                      child: Stack(
                        children : [
                          Center(
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
                                    child: Image.asset(
                                      'assets/profile.png',
                                      width: 140,
                                      height: 140,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                              ),
                          ),
                          Positioned(
                            right: 0,
                            top: 50,
                            child: Container (
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration (
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Container(
                                margin : EdgeInsets.all(4),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration (
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: SvgPicture.asset(
                                        'assets/svg/aperture.svg',
                                    color: Colors.white,)
                                      ),
                                ),
                                ),
                              ),
                            ),
                        ] ,
                      ),
                    ),
                  ),
                  Text(
                    'HodHod Mart',
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'HodHodMart@gmail.com',
                      style: TextStyle(
                          color: kTextColor.withOpacity(0.5),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 250,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(20 , 0 , 20 , 0),
                    child: Column (
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
                        Container (
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(0 , 20 , 0 , 15),
                          decoration: BoxDecoration (
                              border: Border.all(color: Colors.grey,width: 1)
                          ),
                          child : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text (
                              'Julian',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle (
                                fontSize: 16,
                                color: kTextColor,
                              ),
                            ),
                          ),
                        ),
                        Container (
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(0 , 0 , 0 , 15),
                          decoration: BoxDecoration (
                              border: Border.all(color: Colors.grey,width: 1)
                          ),
                          child : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text (
                              'Julian',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle (
                                fontSize: 16,
                                color: kTextColor,
                              ),
                            ),
                          ),
                        ),
                        Container (
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(0 , 0 , 0 , 10),
                          decoration: BoxDecoration (
                              border: Border.all(color: Colors.grey,width: 1)
                          ),
                          child : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text (
                              'Julian',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle (
                                fontSize: 16,
                                color: kTextColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
