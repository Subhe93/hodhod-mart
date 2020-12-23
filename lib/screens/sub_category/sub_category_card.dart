import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/SubCategory.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SubCategoryChildCard extends StatefulWidget {
  final SubCategory category;

  const SubCategoryChildCard({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  _SubCategoryChildCardState createState() => _SubCategoryChildCardState();
}

class _SubCategoryChildCardState extends State<SubCategoryChildCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: signInStartColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width / 2,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(baseUrl + widget.category.image),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.category.name,
              maxLines: 2,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
