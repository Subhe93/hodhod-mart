import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/category_repository.dart';
import 'package:hodhod_mart/repositories/collection_card_repository.dart';
import 'package:hodhod_mart/repositories/collection_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_child_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_repository.dart';
import 'package:hodhod_mart/screens/homePage/components/ads.dart';
import 'package:hodhod_mart/screens/homePage/components/category/categories.dart';
import 'package:hodhod_mart/screens/homePage/components/collections/collection.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<CategoryRepository> categoriesArray = [
    CategoryRepository(name: 'Electronic', image: 'Electronic.png' ,
        subCategoriesList: [
          SubCategoryRepository(name: 'Electronic', image: 'Electronic.png' ,
          children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
            SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
            SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
            SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
            SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
            SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
            SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
            SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
            SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
            SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
          ]),
          SubCategoryRepository(name: 'Fashion', image: 'Fashion.png',
              children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
              ]),
          SubCategoryRepository(name: 'Kitchen', image: 'Kitchen.png',
              children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
              ]),
          SubCategoryRepository(name: 'Toys', image: 'Toys.png',
              children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
              ]),
          SubCategoryRepository(name: 'Make up', image: 'Make up.png',
              children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
              ]),
          SubCategoryRepository(name: 'Electronic', image: 'Electronic.png',
              children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
              ]),
        ]),
    CategoryRepository(name: 'Fashion', image: 'Fashion.png',
        subCategoriesList: [
          SubCategoryRepository(name: 'Electronic', image: 'Electronic.png' ,
              children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
              ]),
          SubCategoryRepository(name: 'Fashion', image: 'Fashion.png',
              children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
              ]),
          SubCategoryRepository(name: 'Kitchen', image: 'Kitchen.png',
              children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
              ]),
          SubCategoryRepository(name: 'Toys', image: 'Toys.png',
              children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
              ]),
          SubCategoryRepository(name: 'Make up', image: 'Make up.png',
              children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
              ]),
          SubCategoryRepository(name: 'Electronic', image: 'Electronic.png' ,
              children: [SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
                SubCategoryChildRepository (image: 'Electronic.png' , name: 'Electronic'),
              ]),
        ]),
    CategoryRepository(name: 'Kitchen', image: 'Kitchen.png',
        subCategoriesList: [
          SubCategoryRepository(name: 'Electronic', image: 'Electronic.png' ,),
          SubCategoryRepository(name: 'Fashion', image: 'Fashion.png'),
          SubCategoryRepository(name: 'Kitchen', image: 'Kitchen.png'),
          SubCategoryRepository(name: 'Toys', image: 'Toys.png'),
          SubCategoryRepository(name: 'Make up', image: 'Make up.png'),
          SubCategoryRepository(name: 'Electronic', image: 'Electronic.png' ,),
        ]),
    CategoryRepository(name: 'Toys', image: 'Toys.png',
        subCategoriesList: [
          SubCategoryRepository(name: 'Electronic', image: 'Electronic.png' ,),
          SubCategoryRepository(name: 'Fashion', image: 'Fashion.png'),
          SubCategoryRepository(name: 'Kitchen', image: 'Kitchen.png'),
          SubCategoryRepository(name: 'Toys', image: 'Toys.png'),
          SubCategoryRepository(name: 'Make up', image: 'Make up.png'),
          SubCategoryRepository(name: 'Electronic', image: 'Electronic.png' ,),
        ]),
    CategoryRepository(name: 'Make up', image: 'Make up.png',
        subCategoriesList: [
          SubCategoryRepository(name: 'Electronic', image: 'Electronic.png' ,),
          SubCategoryRepository(name: 'Fashion', image: 'Fashion.png'),
          SubCategoryRepository(name: 'Kitchen', image: 'Kitchen.png'),
          SubCategoryRepository(name: 'Toys', image: 'Toys.png'),
          SubCategoryRepository(name: 'Make up', image: 'Make up.png'),
          SubCategoryRepository(name: 'Electronic', image: 'Electronic.png' ,),
        ]),
  ];


  List<CollectionRepository> collectionList = [
    CollectionRepository(
      name: 'Electronic Collection',
      collectionList: [
        CollectionCardRepository(
            name: 'Electronic 1',
            price: '1200 \$',
            discount: '30 %',
            image: 'assets/e1.jpeg',
            rate: 3.5),
        CollectionCardRepository(
            name: 'Electronic 2',
            price: '1300 \$',
            discount: '30 %',
            image: 'assets/e2.jpeg',
            rate: 4.5),
        CollectionCardRepository(
            name: 'Electronic 3',
            price: '900 \$',
            discount: '30 %',
            image: 'assets/e3.jpeg',
            rate: 2.5),
        CollectionCardRepository(
            name: 'Learning Toy Toy Toy Toy',
            price: '800 \$',
            discount: '30 %',
            image: 'assets/e4.jpeg',
            rate: 3.0)
      ],
    ),
    CollectionRepository(
      name: 'Toys Collection',
      collectionList: [
        CollectionCardRepository(
            name: 'Learning Toy',
            price: '1200 \$',
            discount: '30 %',
            image: 'assets/toy1.jpeg',
            rate: 3.5),
        CollectionCardRepository(
            name: 'The One Thing Toy',
            price: '1300 \$',
            discount: '30 %',
            image: 'assets/toy2.jpeg',
            rate: 4.5),
        CollectionCardRepository(
            name: 'Pau Potrol Jumbo',
            price: '900 \$',
            discount: '30 %',
            image: 'assets/toy3.jpeg',
            rate: 2.5),
        CollectionCardRepository(
            name: 'Learning Toy',
            price: '800 \$',
            discount: '30 %',
            image: 'assets/toy4.jpeg',
            rate: 3.0)
      ],
    ),
    CollectionRepository(
      name: 'Fashion Collection',
      collectionList: [
        CollectionCardRepository(
            name: 'Learning Toy',
            price: '1200 \$',
            discount: '30 %',
            image: 'assets/f1.jpeg',
            rate: 3.5),
        CollectionCardRepository(
            name: 'The One Thing Toy',
            price: '1300 \$',
            discount: '30 %',
            image: 'assets/f2.jpeg',
            rate: 4.5),
        CollectionCardRepository(
            name: 'Pau Potrol Jumbo',
            price: '900 \$',
            discount: '30 %',
            image: 'assets/f3.jpeg',
            rate: 2.5),
        CollectionCardRepository(
            name: 'Learning Toy',
            price: '800 \$',
            discount: '30 %',
            image: 'assets/f4.jpeg',
            rate: 3.0)
      ],
    ),
    CollectionRepository(
      name: 'Make up Collection',
      collectionList: [
        CollectionCardRepository(
            name: 'Learning Toy',
            price: '1200 ',
            discount: '30 %',
            image: 'assets/m1.jpeg',
            rate: 3.5),
        CollectionCardRepository(
            name: 'The One Thing Toy',
            price: '1300 ',
            discount: '30 %',
            image: 'assets/m2.jpeg',
            rate: 4.5),
        CollectionCardRepository(
            name: 'Pau Potrol Jumbo',
            price: '900',
            discount: '30 %',
            image: 'assets/m3.jpeg',
            rate: 2.5),
        CollectionCardRepository(
            name: 'Learning Toy',
            price: '800',
            discount: '30 %',
            image: 'assets/m4.jpeg',
            rate: 3.0)
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Categories(
            categoriesArray: categoriesArray,
            children: categoriesArray[1].subCategoriesList[1].children,
            subCategoriesArray: categoriesArray[0].subCategoriesList,
            collectionList: collectionList,
          ),
          Ads(adHeight: 200,),
          Padding(
            padding: const EdgeInsets.only(bottom : 15.0),
            child: Container(
              child: ListView(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: collectionList.map((CollectionRepository value) {
                  return Collection(
                    collectionCard: value,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
