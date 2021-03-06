import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/repositories/category_repository.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../constants.dart';

class CategoryCard extends StatelessWidget {
  final CategoryRepository category;

  const CategoryCard({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 15, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: signInEndColor)),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.network(
                        baseUrl + category.image,
                        width: 80,
                        color: signInStartColor,
                        height: 80,
                      ),
                    )
                    //  CachedNetworkImage(
                    //   width: 80,
                    //   height: 80,
                    //   fit: BoxFit.fill,
                    //   imageUrl: baseUrl + category.image,
                    //   placeholder: (context, url) => Container(
                    //     height: 20,
                    //     width: 20,
                    //     child: LoadingIndicator(
                    //       indicatorType: Indicator.ballScale,
                    //       color: signInEndColor,
                    //     ),
                    //   ),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    // ),
                    // Image.network(
                    //   baseUrl + category.image,
                    //   loadingBuilder: (BuildContext context, Widget child,
                    //       ImageChunkEvent loadingProgress) {
                    //     if (loadingProgress == null) return child;
                    //     return Center(
                    //       child: Container(
                    //           width: 20,
                    //           height: 20,
                    //           child: LoadingIndicator(
                    //             indicatorType: Indicator.ballScale,
                    //             color: signInEndColor,
                    //           )),
                    //     );
                    //   },
                    //   width: 80,
                    //   height: 80,
                    //   fit: BoxFit.fill,
                    // ),
                    ),
              ),
            ),
          ),
          Container(
            width: 60,
            height: 40,
            child: Text(
              category.name,
              maxLines: 2,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
