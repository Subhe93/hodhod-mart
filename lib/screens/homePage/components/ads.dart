import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/Banners.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/wishList_provider.dart';
import 'package:hodhod_mart/screens/wishlist_screen/whishlist_screen.dart';
import 'package:provider/provider.dart';

class Ads extends StatefulWidget {
  final double adHeight;

  Ads({Key key, this.adHeight}) : super(key: key);

  @override
  _AdsState createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  bool isLoading = true;
  List<String> swiperList = ['ad1.png', 'ad2.png', 'ad3.png'];
  List<AdBanner> banners = [];
  @override
  void initState() {
    super.initState();
    HttpServices.getBanners().then((value) => {
          setState(() => {
                banners = value,
                isLoading = false,
                Provider.of<WishListProvider>(context, listen: false)
                    .setBanners(value)
              })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.adHeight,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return isLoading
              ? Image.asset(
                  'assets/' + swiperList[index],
                  fit: BoxFit.fill,
                )
              : Image.network(
                  baseUrl + banners[index].image,
                  fit: BoxFit.fill,
                );
        },
        itemCount: isLoading ? 3 : banners.length,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: Colors.amber, activeColor: kTextPurpleColor),
          alignment: Alignment.bottomCenter,
        ),
        control: new SwiperControl(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
