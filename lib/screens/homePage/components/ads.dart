import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hodhod_mart/constants.dart';

import 'package:hodhod_mart/model/Startup.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';

class Ads extends StatefulWidget {
  final double adHeight;
  final List<AdBanner> banners;

  Ads({Key key, this.adHeight, this.banners}) : super(key: key);

  @override
  _AdsState createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  bool _isLoading = false;

  List<String> swiperList = ['ad1.png', 'ad2.png', 'ad3.png'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.adHeight,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return _isLoading
              ? Image.asset(
                  'assets/' + swiperList[index],
                  fit: BoxFit.fill,
                )
              : Image.network(
                  baseUrl + widget.banners[index].image,
                  fit: BoxFit.fill,
                );
        },
        itemCount: _isLoading ? 3 : widget.banners.length,
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
