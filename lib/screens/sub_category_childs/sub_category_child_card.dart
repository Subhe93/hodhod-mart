import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/sub_category_child_repository.dart';

class SubCategoryChildCard extends StatefulWidget {
  final SubCategoryChildRepository child;

  const SubCategoryChildCard({Key key, this.child}) : super(key: key);

  @override
  _SubCategoryChildCardState createState() => _SubCategoryChildCardState();
}

class _SubCategoryChildCardState extends State<SubCategoryChildCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      child: Stack (
        children: [
          Image.asset(
            'assets/' + widget.child.image,
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            fit: BoxFit.fill,
          ),
          Container (
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            color: Colors.grey.withOpacity(0.2),
          ),
          Center (
            child :
            Text (
              widget.child.name,
              maxLines: 2,
              style: TextStyle (
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
