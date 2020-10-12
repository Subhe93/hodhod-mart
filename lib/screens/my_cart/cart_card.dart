import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';

class CartCard extends StatefulWidget {
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container (
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 170,
        child: Row (
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration (
                    boxShadow: [
                      BoxShadow (
                        offset: Offset (1.0 , 1.0),
                        spreadRadius: 2.0,
                        blurRadius: 5.0,
                        color: Colors.grey,
                      )
                    ]
                ),
                child: Image.asset(
                  'assets/m2.jpeg',
                  height: 130,
                  width: 100,
                  fit: BoxFit.fill,),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                height: 130,
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text (
                        'Osaka Entry Fee Superday Entry Fee SuperdayEntry Fee Superday',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle (
                            color: kTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      ),
                    ),
                    RichText (
                      text: TextSpan (
                          text: '118.00 SR    ',
                          style: TextStyle (
                              color: kTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),
                          children: [
                            TextSpan (
                              text: '250.00 SR',
                              style: TextStyle (
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ]
                      ),
                    ),
                    Text (
                      'Size - S',
                      style: TextStyle (
                        fontSize: 16,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                      ),),
                    Container (
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row (
                            children: [
                              InkWell (
                                child: Container (
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration (
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(12.5),
                                  ),
                                  child: Center(
                                    child: Icon (
                                      Icons.remove,
                                    size: 18,
                                    color: Colors.white,),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left : 10 , right : 10.0),
                                child: Center(
                                  child: Text (
                                      '01',
                                  style: TextStyle (
                                    color: kTextColor,
                                  ),
                                  ),
                                ),
                              ),
                              InkWell (
                                child: Container (
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration (
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(12.5),
                                  ),
                                  child: Center(
                                    child: Icon (
                                      Icons.add,
                                      size: 18,
                                      color: Colors.white,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox (width: MediaQuery.of(context).size.width * 0.05,),
                          Row (
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell (
                                child: Text (
                                  'Edit',
                                  style: TextStyle (
                                    color: Colors.redAccent,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text (' - ',
                                style: TextStyle (
                                  color: Colors.redAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),),
                              InkWell (
                                child: Text (
                                  'Delete',
                                  style: TextStyle (
                                    color: Colors.redAccent,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
