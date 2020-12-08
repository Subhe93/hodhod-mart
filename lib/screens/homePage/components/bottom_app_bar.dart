import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hodhod_mart/Manager/Manager.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/User.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/homePage/home_page.dart';
import 'package:hodhod_mart/screens/my_account/my_account.dart';
import 'package:hodhod_mart/screens/my_cart/my_cart.dart';
import 'package:hodhod_mart/screens/search/search_page.dart';
import 'package:hodhod_mart/screens/wishlist_screen/whishlist_screen.dart';
import 'package:provider/provider.dart';

class HomeBottomBar extends StatefulWidget {
  int isSelected = 0;
  @override
  _HomeBottomBarState createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  PageController _myPage = PageController(initialPage: 0);
  var iconWidth = 25.0;
  var iconHeight = 25.0;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<ModelsProvider>(context, listen: true).user;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Provider.of<ModelsProvider>(context, listen: false)
              .isLoggedin()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyAccount(),
              ),
            );
          } else {
            Manager.openRegisterSheet(context);
          }
        },
        child: CircleAvatar(
          radius: 50,
          backgroundImage: (user == null || user.image == null)
              ? AssetImage('assets/profile.png')
              : NetworkImage(baseUrl + user.image),
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
                                color: signInEndColor,
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
                                color: signInEndColor,
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
                                color: signInEndColor,
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
                                color: signInEndColor,
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
      appBar: homeAppBar(
          true, false, context, false, 'HodHod MART', searchAction(context)),
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
