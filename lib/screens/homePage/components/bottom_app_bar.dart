import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/homePage/home_page.dart';
import 'package:hodhod_mart/screens/my_account/my_account.dart';
import 'package:hodhod_mart/screens/my_cart/my_cart.dart';

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
      floatingActionButton: Container(
        margin: EdgeInsets.only(top : 50),
        width: 80,
        height: 80,
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: RawMaterialButton (
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return MyAccount ();
            }));
          },
          shape: new CircleBorder(),
          elevation: 0.0,
          child: ClipRRect (
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
                'assets/profile.png',
            width: 80,
            height: 80,
            fit: BoxFit.fill,),
          )
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isSelected = 0;
                          _myPage.jumpToPage(0);
                        });
                      },
                      child: SvgPicture.asset(
                        widget.isSelected == 0 ? 'assets/svg/home-06.svg' : 'assets/svg/home-01.svg',
                        width: iconWidth,
                        height: iconHeight,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isSelected = 1;
                          _myPage.jumpToPage(1);
                        });
                      },
                      child: SvgPicture.asset(
                        widget.isSelected == 1 ? 'assets/svg/search-08.svg' : 'assets/svg/search-03.svg',
                        width: iconWidth,
                        height: iconHeight,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20, left: 25, right: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isSelected = 2;
                          _myPage.jumpToPage(2);
                        });
                      },
                      child: SvgPicture.asset(
                        widget.isSelected == 2 ? 'assets/svg/love-07.svg' : 'assets/svg/love-02.svg',
                        width: iconWidth,
                        height: iconHeight,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Wishlist',
                      style: TextStyle(
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isSelected = 3;
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return MyCart ();
                          }));
                          // _myPage.jumpToPage(3);
                        });
                      },
                      child: SvgPicture.asset(
                        widget.isSelected == 3 ? 'assets/svg/cart-09.svg' : 'assets/svg/cart-04.svg',
                        width: iconWidth,
                        height: iconHeight,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Cart',
                      style: TextStyle(
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        elevation: 5.0,
        // shape: CircularNotchedRectangle(),
        color: Colors.white,
        notchMargin: 0.0,
      ),
      backgroundColor: Colors.white,
      appBar: homeAppBar(true , context, false , 'HODHOT MART' , searchAction()),
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[
          HomePage(),
          Center(
            child: Container(
              child: Text('Empty Body 1'),
            ),
          ),
          Center(
            child: Container(
              child: Text('Empty Body 2'),
            ),
          ),
          Center(
            child: Container(
              child: Text('Empty Body 3'),
            ),
          )
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
