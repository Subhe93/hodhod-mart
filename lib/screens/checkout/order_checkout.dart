import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';

class OrderCheckout extends StatefulWidget {
  @override
  _OrderCheckoutState createState() => _OrderCheckoutState();
}

class _OrderCheckoutState extends State<OrderCheckout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column (
                  children : [
                    Padding(
                      padding: const EdgeInsets.only(bottom : 10.0),
                      child: Container (
                        padding: EdgeInsets.all(20),
                        height: 260,
                        width: MediaQuery.of(context).size.width,
                        color : Colors.white,
                        child: Column (
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SHIPPING ADDRESS',
                              maxLines: 1,
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Column (
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top : 10.0 , bottom: 10),
                                  child: Row (
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset('assets/svg/mail.svg',
                                        color: Colors.amber,
                                        width: 30,
                                        height: 30,),
                                      Padding(
                                        padding: const EdgeInsets.only(left : 15.0),
                                        child: Text ('Email'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top : 0 , bottom: 10),
                                  child: Row (
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset('assets/svg/phone.svg',
                                        color: Colors.blueAccent,
                                        width: 30,
                                        height: 30,),
                                      Padding(
                                        padding: const EdgeInsets.only(left : 15.0),
                                        child: Text ('Phone'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top : 8.0),
                                  child: Text (
                                    'dsjhfsdjdsfhjsdfj hdfj jskdfh d fgksg fkdsj fgskfk sgjf ksd fkjdsjgfs dkjfgds fdskgf ksjdgf kjsdgf kjsdf gsjd fkjsgd fkjsg fjkgjsdf gkjsgdjfg jksdgf sdjkfgkdgsjf skdgfk dsgfsd',
                                    maxLines: 5,
                                    style: TextStyle (
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color:kTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom : 10.0),
                      child: Container (
                        padding: EdgeInsets.only(right : 20 , left: 20),
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        color : Colors.white,
                        child: Column (
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SAVED ADDRESS',
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                CircularCheckBox(
                                    value: true,
                                    onChanged: null,
                                disabledColor: Colors.amber,),
                              ],
                            ),
                            Column (
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top : 10.0 , bottom: 10),
                                  child: Row (
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset('assets/svg/mail.svg',
                                            color: Colors.amber,
                                            width: 30,
                                            height: 30,),
                                          Padding(
                                            padding: const EdgeInsets.only(left : 15.0),
                                            child: Text ('Email'),
                                          ),
                                        ],
                                      ),
                                      IconButton (
                                        icon: Icon(Icons.restore_from_trash,
                                        color: Colors.grey.withOpacity(0.6),
                                          size: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top : 0 , bottom: 10),
                                  child: Row (
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset('assets/svg/phone.svg',
                                            color: Colors.blueAccent,
                                            width: 30,
                                            height: 30,),
                                          Padding(
                                            padding: const EdgeInsets.only(left : 15.0),
                                            child: Text ('Phone'),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 50,
                                        height: 25,
                                        child: FlatButton (
                                          padding: EdgeInsets.all(0),
                                          color: Colors.redAccent,
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                              // return AddAddress ();
                                            }));
                                          },
                                          child: Center(
                                              child: Text (
                                                'Edit',
                                                style: TextStyle (
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                ),
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top : 8.0),
                                  child: Text (
                                    'dsjhfsdjdsfhjsdfj hdfj jskdfh d fgksg fkdsj fgskfk sgjf ksd fkjdsjgfs dkjfgds fdskgf ksjdgf kjsdgf kjsdf gsjd fkjsgd fkjsg fjkgjsdf gkjsgdjfg jksdgf sdjkfgkdgsjf skdgfk dsgfsd',
                                    maxLines: 5,
                                    style: TextStyle (
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color:kTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom : 10.0),
                      child: Container (
                        padding: EdgeInsets.only(right : 20 , left: 20),
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        color : Colors.white,
                        child: Column (
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SAVED ADDRESS',
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                CircularCheckBox(
                                  value: true,
                                  onChanged: null,
                                  disabledColor: Colors.amber,),
                              ],
                            ),
                            Column (
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top : 10.0 , bottom: 10),
                                  child: Row (
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset('assets/svg/mail.svg',
                                            color: Colors.amber,
                                            width: 30,
                                            height: 30,),
                                          Padding(
                                            padding: const EdgeInsets.only(left : 15.0),
                                            child: Text ('Email'),
                                          ),
                                        ],
                                      ),
                                      IconButton (
                                        icon: Icon(Icons.restore_from_trash,
                                          color: Colors.grey.withOpacity(0.6),
                                          size: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top : 0 , bottom: 10),
                                  child: Row (
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset('assets/svg/phone.svg',
                                            color: Colors.blueAccent,
                                            width: 30,
                                            height: 30,),
                                          Padding(
                                            padding: const EdgeInsets.only(left : 15.0),
                                            child: Text ('Phone'),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 50,
                                        height: 25,
                                        child: FlatButton (
                                          padding: EdgeInsets.all(0),
                                          color: Colors.redAccent,
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                              // return AddAddress ();
                                            }));
                                          },
                                          child: Center(
                                              child: Text (
                                                'Edit',
                                                style: TextStyle (
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                ),
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top : 8.0),
                                  child: Text (
                                    'dsjhfsdjdsfhjsdfj hdfj jskdfh d fgksg fkdsj fgskfk sgjf ksd fkjdsjgfs dkjfgds fdskgf ksjdgf kjsdgf kjsdf gsjd fkjsgd fkjsg fjkgjsdf gkjsgdjfg jksdgf sdjkfgkdgsjf skdgfk dsgfsd',
                                    maxLines: 5,
                                    style: TextStyle (
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color:kTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: EdgeInsets.all(20),
                  color: Colors.amber,
                  child: Center(
                      child: Text(
                        'ADD NEW ADDRESS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.deepPurple,
                  child: Center(
                      child: Text(
                        'NEXT STEP',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
