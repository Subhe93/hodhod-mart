import 'package:flutter/material.dart';

class NotificationCard extends StatefulWidget {
  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20 , 20 , 20 , 10),
      height: 180,
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow (
            offset: Offset (0.5 , 0.5),
            blurRadius: 3.0,
            spreadRadius: 0.1,
            color: Colors.grey.withOpacity(0.3),
          )
        ]
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0 , 20 , 15 , 10),
          child: Row (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar (
                radius: 25,
                backgroundColor: Colors.red,
              ),
              Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text (
                      'Your Order Place',
                    style: TextStyle (
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text (
                        'hello hellohello hellohello hellohello hellohello hellohello hellohello'
                            ' hellohello hellohello hellohello hellohello hellohello hello',
                      maxLines: 4,
                      style: TextStyle (
                        fontSize: 15,
                        color: Colors.grey.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
