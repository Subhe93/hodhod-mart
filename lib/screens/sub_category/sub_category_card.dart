import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/repositories/sub_category_repository.dart';


class SubCategoryCard extends StatefulWidget {
  final SubCategoryRepository subCategory ;

  const SubCategoryCard({Key key, this.subCategory}) : super(key: key);
  @override
  _SubCategoryCardState createState() => _SubCategoryCardState();
}

class _SubCategoryCardState extends State<SubCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left : 15 , top : 15 , right: 10),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom : 10.0 ),
            child: CircleAvatar (
              radius: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  'assets/' + widget.subCategory.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text (
            widget.subCategory.name,
            style: TextStyle (
              fontWeight: FontWeight.w600,
              color: kTextColor,
              fontSize: 14,
            ),),
        ],
      ),
    );
  }
}
