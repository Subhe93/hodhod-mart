import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/screens/my_account/add_address/add_address.dart';
import 'package:hodhod_mart/screens/my_account/edit_account_info/edit_account_info.dart';

class AccountInfoBody extends StatefulWidget {
  @override
  _AccountInfoBodyState createState() => _AccountInfoBodyState();
}

class _AccountInfoBodyState extends State<AccountInfoBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 270,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
                Container(
                  width: 75,
                  height: 30,
                  child: FlatButton (
                    color: Colors.redAccent,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return EditAccountInfo();
                      }));
                    },
                    child: Center(
                        child: Text (
                          'Edit',
                          style: TextStyle (
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top : 15.0),
              child: SingleChildScrollView (
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20 , 15 , 20 , 0),
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
                                margin: EdgeInsets.fromLTRB(0 , 15 , 0 , 15),
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
                          ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      height: 200,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20 , 15 , 20 , 20),
                        child: Column (
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ADDRESSES',
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 25,
                                  child: FlatButton (
                                    color: Colors.redAccent,
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return AddAddress ();
                                      }));
                                    },
                                    child: Center(
                                        child: Text (
                                          'Edit',
                                          style: TextStyle (
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                            Text (
                              'office no 1 office no 1 office no 1 office no 1 office no 1 office no 1 office no 1 office no 1'
                                  ' office no 1 office no 1 office no 1 office no 1'
                                  ' office no 1 office no 1 office no 1 office no 1 office no 1',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle (
                                color: Colors.grey.withOpacity(0.8),
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: FlatButton (
                                onPressed: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context){
                                  //   return TrackOrder();
                                  // }));
                                },
                                child: Text (
                                  'ADD NEW ADDRESS',
                                  style: TextStyle (
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.deepPurple,
            child: Center(
                child: Text(
                  'DELETE ACCOUNT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
