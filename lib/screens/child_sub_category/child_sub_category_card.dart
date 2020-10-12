import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hodhod_mart/repositories/collection_card_repository.dart';
import 'package:hodhod_mart/screens/product/product_page.dart';

class ChildSubCategoryCard extends StatefulWidget {
  final CollectionCardRepository item;

  const ChildSubCategoryCard({Key key, this.item}) : super(key: key);

  @override
  _ChildSubCategoryCardState createState() => _ChildSubCategoryCardState();
}

class _ChildSubCategoryCardState extends State<ChildSubCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
            builder: (context){
          return ProductPage (item: widget.item,);
        }));
      },
      child: Container(
        decoration: BoxDecoration (
            color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.9) , width: 0.3)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: Image.asset(
                widget.item.image,
                width: (MediaQuery.of(context).size.width / 2) - 2,
                height: MediaQuery.of(context).size.width / 1.2,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              flex: 1,
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                    child: Text (
                      widget.item.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle (
                        fontWeight: FontWeight.w500,
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0 , 6.0 , 0.0 ,0),
                    child: RatingBar (
                      initialRating: widget.item.rate,
                      itemSize: 12,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0 , 6.0 , 10 ,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text (
                              widget.item.price,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle (
                                fontWeight: FontWeight.w500,
                              ),),
                            Text (
                              widget.item.price,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle (
                                fontWeight: FontWeight.w500,
                              ),),
                          ],
                        ),
                        Icon (
                          Icons.favorite_border,
                          color: Colors.grey.withOpacity(0.5),
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
