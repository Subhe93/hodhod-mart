import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hodhod_mart/model/AdBanners.dart';

import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class StaticBanners extends StatelessWidget {
  const StaticBanners({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> swiperList = ['ad1.png', 'ad2.png', 'ad3.png'];
    List<AdBanner> banners =
        Provider.of<ModelsProvider>(context, listen: false).banners;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return false
              ? Image.asset(
                  'assets/' + swiperList[index],
                  fit: BoxFit.fitHeight,
                )
              : Image.network(
                  baseUrl + banners[index].image,
                  fit: BoxFit.fill,
                );
        },
        itemCount: false ? 3 : banners.length,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: signInStartColor, activeColor: signInEndColor),
          alignment: Alignment.bottomCenter,
        ),
        control: new SwiperControl(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
