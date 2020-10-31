import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/whoshlist_model.dart';

import '../../constants.dart';

class WishListCard extends StatefulWidget {
  WishListItem wishList;

  WishListCard({this.wishList});

  @override
  _WishListCardState createState() => _WishListCardState();
}

class _WishListCardState extends State<WishListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Center(
        child: Container(
          height: 110,
          width: MediaQuery.of(context).size.width * 0.95,
          color: Colors.transparent,
          child: Card(
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0)),
                    child: Image.asset(widget.wishList.imageUrl,
                        alignment: Alignment.centerLeft,fit: BoxFit.fitHeight,height: 100,width: 100,)),
                SizedBox(width: 6,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.6,
                      child: Text(
                        widget.wishList.title,
                        style: TextStyle(fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Transform(
                              transform:Matrix4.identity()..scale(0.9),
                              child: Chip(

                                backgroundColor: signInEndColor,
                                label: Text(
                                  'Always in stock',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),

                            Transform(
                              transform: Matrix4.identity()..scale(0.9),
                              child: Chip(
                                backgroundColor: signInStartColor,
                                label: Text(
                                  'fast delivery',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],),

                          Text(widget.wishList.price.toString()+" \$"),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
