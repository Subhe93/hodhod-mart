import 'package:flutter/material.dart';

import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:hodhod_mart/screens/homePage/components/home_body.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    if (Provider.of<ModelsProvider>(context, listen: false).homeIsLoading) {
      HttpServices.getStartup().then((value) => {
            Provider.of<ModelsProvider>(context, listen: false)
                .setCategories(value.categories),
            Provider.of<ModelsProvider>(context, listen: false)
                .setBanners(value.banners)
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<ModelsProvider>(context).homeIsLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : HomeBody();
  }
}
