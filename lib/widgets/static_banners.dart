import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hodhod_mart/provider/wishList_provider.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class StaticBanners extends StatelessWidget {
  const StaticBanners({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> swiperList = ['ad1.png', 'ad2.png', 'ad3.png'];
    var banners = Provider.of<WishListProvider>(context, listen: false).banners;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return banners.isEmpty
              ? Image.asset('assets/' + swiperList[index])
              : Image.network(
                  baseUrl + banners[index].image,
                  fit: BoxFit.fill,
                );
        },
        itemCount: banners.isEmpty ? 3 : banners.length,
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
