import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';

class ProductBottomSheet extends StatefulWidget {
  @override
  _ProductBottomSheetState createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends State<ProductBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.all(4),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: kTextColor.withOpacity(0.7),
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(),
                    FlatButton(
                      child: Text(
                        'Clear All',
                        style: TextStyle(
                          fontSize: 17,
                          color: instaTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Container(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height * 0.7 - 110) ,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration (
                      border: Border (
                        right : BorderSide (color: Colors.grey.withOpacity(0.3),width: 1)
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlatButton(
                          child: Text('Price'),
                        ),
                        FlatButton(
                          child: Text('Price'),
                        ),
                        FlatButton(
                          child: Text('Price'),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlatButton(
                        child: Text('Price price price price price'),
                      ),
                      FlatButton(
                        child: Text('Price'),
                      ),
                      FlatButton(
                        child: Text('Price'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: Colors.deepPurple,
          child: Center(
            child: FlatButton(
                child: Text(
                  'APPLY',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ),
        )
      ],
    );
  }
}
