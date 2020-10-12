import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/collection_card_repository.dart';
import 'package:hodhod_mart/screens/child_sub_category/body.dart';
import 'package:hodhod_mart/screens/child_sub_category/components/bottom_sheet.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';

class ChildSubCategory extends StatefulWidget {
  final List<CollectionCardRepository> itemsList;

  const ChildSubCategory({Key key, this.itemsList}) : super(key: key);

  @override
  _ChildSubCategoryState createState() => _ChildSubCategoryState();
}

class _ChildSubCategoryState extends State<ChildSubCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(false , context, true , 'Sub Categories' , searchAction()),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet<dynamic>(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.only(topRight: Radius.circular(20) , topLeft: Radius.circular(20))
            ),
            builder: (context){
              return Wrap(
                children : [
                  SafeArea(
                    bottom: true,
                    child: Container (
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: BoxDecoration (
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20) , topLeft: Radius.circular(20))
                      ),
                      child: ProductBottomSheet(),
                    ),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
        ),
      ),
      body: ChildSubCategoryBody(itemsList: widget.itemsList,),
    );
  }
}
