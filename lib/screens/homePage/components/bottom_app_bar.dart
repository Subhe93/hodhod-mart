import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/homePage/home_page.dart';
import 'package:hodhod_mart/screens/my_account/my_account.dart';
import 'package:hodhod_mart/screens/my_cart/my_cart.dart';
import 'package:hodhod_mart/screens/search/search_page.dart';

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
                            ? SvgPicture.asset('assets/svg/home-01.svg')
                            : SvgPicture.asset('assets/svg/home-06.svg')),
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
                        height: MediaQuery.of(context).size.height / 32,
                        child: widget.isSelected != 1
                            ? SvgPicture.asset('assets/svg/search-03.svg')
                            : SvgPicture.asset('assets/svg/search-08.svg')),
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
                        height: MediaQuery.of(context).size.height / 32,
                        child: widget.isSelected != 2
                            ? SvgPicture.asset('assets/svg/love-02.svg')
                            : SvgPicture.asset('assets/svg/love-07.svg')),
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
                    widget.isSelected = 3;
                    _myPage.jumpToPage(3);
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height / 32,
                        child: widget.isSelected != 3
                            ? SvgPicture.asset('assets/svg/cart-04.svg')
                            : SvgPicture.asset('assets/svg/cart-09.svg')),
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
        children: <Widget>[
          HomePage(),
          SearchPage(),
          Center(
            child: Container(
              child: Text('Empty Body 2'),
            ),
          ),
          MyCart()
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
