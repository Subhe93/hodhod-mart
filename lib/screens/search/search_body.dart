import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/model/MainCategory.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:hodhod_mart/screens/search/searchResults/searchResultPage.dart';
import 'package:provider/provider.dart';

class SearchBody extends StatefulWidget {
  SearchBody({Key key}) : super(key: key);

  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  List<MainCategory> categories;
  List<DropdownMenuItem> items;
  bool loading;
  var _value;
  String keyword;
  final TextEditingController _search = TextEditingController();
  @override
  void initState() {
    super.initState();
    _value = 0;
    loading = false;
    categories = [];
  }

  @override
  Widget build(BuildContext context) {
    categories = Provider.of<ModelsProvider>(context, listen: true).categories;
    items = [
      DropdownMenuItem(
        child:
            Text(Applocalizations.of(context).translate("No Category Chosen")),
        value: 0,
      )
    ];
    for (var cat in categories) {
      items.add(DropdownMenuItem(
        value: cat.id,
        child: Container(
          height: 70,
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.network(
                        baseUrl + cat.icon,
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

                // child: Image.network(
                //   baseUrl + cat.image,
                //   fit: BoxFit.fill,
                // )
              ),
              SizedBox(
                width: 5,
              ),
              Text(cat.name)
            ],
          ),
        ),
      ));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 50,
                child: Theme(
                  data: ThemeData(primaryColor: signInEndColor),
                  child: TextField(
                    controller: _search,
                    decoration: InputDecoration(
                        hoverColor: signInStartColor,
                        prefixIcon: Icon(Icons.search),
                        focusColor: signInStartColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Applocalizations.of(context)
                      .translate("Search within a specific category"),
                  style: TextStyle(
                      color: signInStartColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                    underline: SizedBox(),
                    // dropdownColor: Colors.grey,
                    hint: Text(
                      Applocalizations.of(context)
                          .translate("No Category Chosen"),
                      textAlign: TextAlign.center,
                    ),
                    value: _value,
                    items: items,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    }),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loading
                      ? CircularProgressIndicator()
                      : InkWell(
                          onTap: () => {
                            setState(() => {loading = true}),
                            HttpServices.search(_search.text.trim(),
                                    _value.toString(), "1", context)
                                .then((value) => {
                                      setState(() => {loading = false}),
                                      if (Provider.of<ModelsProvider>(context,
                                              listen: false)
                                          .internetAccess)
                                        {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return SearchResults(
                                                  searchResults: value,
                                                  searchKeyWord:
                                                      _search.text.trim(),
                                                  catID: _value,
                                                );
                                              },
                                            ),
                                          )
                                        }
                                    })
                          },
                          child: Container(
                            decoration: BoxDecoration(color: signInEndColor),
                            height: 40,
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                Text(
                                  Applocalizations.of(context)
                                      .translate("Search"),
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
