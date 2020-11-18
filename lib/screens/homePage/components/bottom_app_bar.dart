import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/homePage/home_page.dart';
import 'package:hodhod_mart/screens/my_account/my_account.dart';
import 'package:hodhod_mart/screens/my_cart/my_cart.dart';
import 'package:hodhod_mart/screens/search/search_page.dart';
import 'package:hodhod_mart/screens/wishlist_screen/whishlist_screen.dart';

class HomeBottomBar extends StatefulWidget {
  int isSelected = 0;
  @override
  _HomeBottomBarState createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  PageController _myPage = PageController(initialPage: 0);
  var iconWidth = 25.0;
  var iconHeight = 25.0;
  var iconColor = Colors.black.withOpacity(0.6);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // HttpServices.GetUserInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyAccount(),
            ),
          );
        },
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/profile.png'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isSelected = 0;
                    _myPage.jumpToPage(0);
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height / 32,
                        child: widget.isSelected != 0
                            ? Icon(FontAwesomeIcons.home)
                            : Icon(
                                FontAwesomeIcons.home,
                                color: Colors.orange[300],
                              )),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        'Home',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isSelected = 1;
                    _myPage.jumpToPage(1);
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        //  height: MediaQuery.of(context).size.height / 32,
                        child: widget.isSelected != 1
                            ? Icon(FontAwesomeIcons.search)
                            : Icon(
                                FontAwesomeIcons.search,
                                color: Colors.orange[300],
                              )),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        'Search',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 32,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isSelected = 2;
                    _myPage.jumpToPage(2);
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        //  height: MediaQuery.of(context).size.height / 32,
                        child: widget.isSelected != 2
                            ? Icon(FontAwesomeIcons.heart)
                            : Icon(
                                FontAwesomeIcons.heart,
                                color: Colors.orange[300],
                              )),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        'Wishlist',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isSelected = 3;
                    _myPage.jumpToPage(3);
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        // height: MediaQuery.of(context).size.height / 32,
                        child: widget.isSelected != 3
                            ? Icon(FontAwesomeIcons.cartArrowDown)
                            : Icon(
                                FontAwesomeIcons.cartArrowDown,
                                color: Colors.orange[300],
                              )),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        'Cart',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: homeAppBar(true, context, false, 'HODHOD MART', searchAction()),
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[HomePage(), SearchPage(), WhishList(), MyCart()],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
