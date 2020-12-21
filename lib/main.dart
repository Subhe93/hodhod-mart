import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';

import 'package:hodhod_mart/screens/start_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelsProvider>(
          create: (_) => ModelsProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Anago', accentColor: signInEndColor),
        debugShowCheckedModeBanner: false,
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'AE')],
        localizationsDelegates: [
          Applocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        color: Colors.white,
        home: StartPage(),
      ),
    ),
  );
}
