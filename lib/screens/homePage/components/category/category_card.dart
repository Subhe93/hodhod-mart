import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/repositories/category_repository.dart';

import '../../../../constants.dart';

class CategoryCard extends StatelessWidget {
  final CategoryRepository category;

  const CategoryCard({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 15, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CircleAvatar(
              radius: 38,
              backgroundColor: signInStartColor,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(
                    'assets/' + category.image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Text(
            category.name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: kTextColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
