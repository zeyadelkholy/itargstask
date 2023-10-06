import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:itargstask/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'constants/Navigation Bar.dart';
import 'constants/app_localization.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child:  const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return  MaterialApp(
      supportedLocales:  [
        Locale('en', ''),
        Locale('ar', ''),
      ],

      localizationsDelegates:  [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      localeResolutionCallback: (devicelocal,supportedlocales){
         for ( var locale in supportedlocales){
           if (devicelocal!=null && devicelocal.languageCode==locale.languageCode){
             return devicelocal;
           }
         }
           return supportedlocales.first;
      },



      theme: themeProvider.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const CustomNavigationBar(),
    );
  }
}
