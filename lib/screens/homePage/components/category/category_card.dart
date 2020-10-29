import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/repositories/category_repository.dart';

class CategoryCard extends StatelessWidget {
  final CategoryRepository category ;

  const CategoryCard({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left : 2 , top : 15 , right: 2),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom : 0.0 ),
            child: CircleAvatar (
              backgroundColor: Colors.white,
              radius: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                    'assets/' + category.image,
                  width: 55,
                  height: 55,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text (
              category.name,
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
