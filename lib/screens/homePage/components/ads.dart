import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hodhod_mart/constants.dart';


class Ads extends StatelessWidget {
  final double adHeight;
  List<String> swiperList = ['ad1.png' , 'ad2.png' , 'ad3.png'];

  Ads({Key key, this.adHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: adHeight,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return new Image.asset('assets/' + swiperList[index] ,fit: BoxFit.fill,);
        },
        itemCount: 3,
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
