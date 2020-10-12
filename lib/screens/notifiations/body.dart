import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/screens/notifiations/notification_card.dart';

class NotificationsBody extends StatefulWidget {
  final List<String> notificationsArray = [];

  @override
  _NotificationsBodyState createState() => _NotificationsBodyState();
}

class _NotificationsBodyState extends State<NotificationsBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white54.withOpacity(0.5),
        child: widget.notificationsArray.isNotEmpty
            ? ListView (
          children : widget.notificationsArray.map((String value) {
            return NotificationCard();
          }).toList(),
        )
            : Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top : 150),
                      width: 200,
                      height: 200,
                      child: SvgPicture.asset('assets/svg/bell.svg',
                        color: Colors.grey.withOpacity(0.6),),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        'Your order is empty!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 250,
                      child: Text(
                        'Explore more and buy some items',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
