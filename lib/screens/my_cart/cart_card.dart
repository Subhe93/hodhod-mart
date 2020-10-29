import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';

import '../../constants.dart';
import '../../constants.dart';

class CartCard extends StatefulWidget {
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    var width2 = 30.0;
    var height2 = 30.0;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Clinique.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.red[800],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .60,
                  child: Text(
                    'Osaka Entry Fee Superday Entry Fee SuperdayEntry Fee Superday',
                    maxLines: 3,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, letterSpacing: 0.4),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/m2.jpeg',
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width * .20,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'SAR 250',
              style: TextStyle(
                  fontWeight: FontWeight.bold, letterSpacing: .8, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Order Now And get ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: 'Free Shipping',
                          style: TextStyle(
                            color: signInStartColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width2,
                    height: height2,
                    decoration: BoxDecoration(
                        border: Border.all(), color: Colors.transparent),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width2 / 2.7, top: height2 / 2.5),
                      child: TextField(
                        style: TextStyle(fontSize: width2 / 2),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration().copyWith(hintText: '1'),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Chip(
                        label: Text(
                          'Fast Delivery',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: signInStartColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   color: Colors.red[900],
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height / 15,
          //   child: Icon(
          //     Icons.delete,
          //   ),
          // ),
        ],
      ),
    );
    //Container(
    //   child: Container(
    //     padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
    //     height: 200,
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Flexible(
    //           flex: 2,
    //           child: Container(
    //             decoration: BoxDecoration(boxShadow: [
    //               BoxShadow(
    //                 offset: Offset(1.0, 1.0),
    //                 spreadRadius: 2.0,
    //                 blurRadius: 5.0,
    //                 color: Colors.grey,
    //               )
    //             ]),
    //             child: Image.asset(
    //               'assets/m2.jpeg',
    //               height: 200,
    //               width: 150,
    //               fit: BoxFit.fill,
    //             ),
    //           ),
    //         ),
    //         Flexible(
    //           flex: 5,
    //           child: Container(
    //             margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
    //             height: 130,
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Container(
    //                   width: MediaQuery.of(context).size.width * 0.6,
    //                   child: Text(
    //                     'Osaka Entry Fee Superday Entry Fee SuperdayEntry Fee Superday',
    //                     maxLines: 2,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: TextStyle(
    //                         color: kTextColor,
    //                         fontWeight: FontWeight.w500,
    //                         fontSize: 16),
    //                   ),
    //                 ),
    //                 RichText(
    //                   text: TextSpan(
    //                       text: '118.00 SR    ',
    //                       style: TextStyle(
    //                           color: kTextColor,
    //                           fontWeight: FontWeight.w500,
    //                           fontSize: 16),
    //                       children: [
    //                         TextSpan(
    //                           text: '250.00 SR',
    //                           style: TextStyle(
    //                             color: Colors.grey,
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 16,
    //                             decoration: TextDecoration.lineThrough,
    //                           ),
    //                         ),
    //                       ]),
    //                 ),
    //                 Text(
    //                   'Size - S',
    //                   style: TextStyle(
    //                     fontSize: 16,
    //                     color: Colors.deepPurple,
    //                     fontWeight: FontWeight.w500,
    //                   ),
    //                 ),
    //                 Container(
    //                   height: 30,
    //                   width: MediaQuery.of(context).size.width * 0.55,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Row(
    //                         children: [
    //                           InkWell(
    //                             child: Container(
    //                               width: 25,
    //                               height: 25,
    //                               decoration: BoxDecoration(
    //                                 color: Colors.amber,
    //                                 borderRadius: BorderRadius.circular(12.5),
    //                               ),
    //                               child: Center(
    //                                 child: Icon(
    //                                   Icons.remove,
    //                                   size: 18,
    //                                   color: Colors.white,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsets.only(
    //                                 left: 10, right: 10.0),
    //                             child: Center(
    //                               child: Text(
    //                                 '01',
    //                                 style: TextStyle(
    //                                   color: kTextColor,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           InkWell(
    //                             child: Container(
    //                               width: 25,
    //                               height: 25,
    //                               decoration: BoxDecoration(
    //                                 color: Colors.amber,
    //                                 borderRadius: BorderRadius.circular(12.5),
    //                               ),
    //                               child: Center(
    //                                 child: Icon(
    //                                   Icons.add,
    //                                   size: 18,
    //                                   color: Colors.white,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         width: MediaQuery.of(context).size.width * 0.05,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                         children: [
    //                           InkWell(
    //                             child: Text(
    //                               'Edit',
    //                               style: TextStyle(
    //                                 color: Colors.redAccent,
    //                                 fontSize: 15,
    //                                 fontWeight: FontWeight.w500,
    //                               ),
    //                             ),
    //                           ),
    //                           Text(
    //                             ' - ',
    //                             style: TextStyle(
    //                               color: Colors.redAccent,
    //                               fontSize: 15,
    //                               fontWeight: FontWeight.w500,
    //                             ),
    //                           ),
    //                           InkWell(
    //                             child: Text(
    //                               'Delete',
    //                               style: TextStyle(
    //                                 color: Colors.redAccent,
    //                                 fontSize: 15,
    //                                 fontWeight: FontWeight.w500,
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
