import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:itargstask/cubit/local_state.dart';
import 'package:provider/provider.dart';

import 'constants/Navigation Bar.dart';
import 'constants/app_localization.dart';
import 'cubit/local_cubit.dart';
import 'cubit/theme_provider.dart';

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

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
            LocaleCubit()
              ..getSavedLanguage(),
          ),
        ],
        child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
            builder: (context, state) {
              return MaterialApp(
                locale: state.locale,
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }

                  return supportedLocales.first;
                },


                theme: themeProvider.isDarkTheme ? ThemeData.dark() : ThemeData
                    .light(),
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                home: const CustomNavigationBar(),
              );
            }));
  }}
