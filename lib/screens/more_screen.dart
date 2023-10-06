  import 'dart:ui';
  import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import '../constants/app_localization.dart';
  import '../constants/custom_text.dart';
  import '../provider/theme_provider.dart';

  class MoreScreen extends StatefulWidget {
    const MoreScreen({Key? key}) : super(key: key);

    @override
    State<MoreScreen> createState() => _MoreScreenState();
  }


  class _MoreScreenState extends State<MoreScreen> {

    bool _switchValue2 = true;
    String currentLanguage = 'en';



    @override
    Widget build(BuildContext context) {
      final themeProvider = Provider.of<ThemeProvider>(context);

      return SafeArea(child: Scaffold(

        appBar:AppBar(
          title:  CustomText(
            text: AppLocalizations.of(context)!
                .translate("More key"),
            fontWeight: FontWeight.bold,
            color: Colors.black,
            size: 25,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,

        ) ,


        body: Column(
          crossAxisAlignment:   CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              child: CustomText(text: AppLocalizations.of(context)!
                  .translate("settings key"),fontWeight: FontWeight.bold,size:20),
            ),
            const Divider(

              color: Colors.grey,
              thickness: 1,

            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                children: [
                   CustomText(text: AppLocalizations.of(context)!
                      .translate("Dark Mode key"),size: 20,),
                  const Spacer(),


                  CupertinoSwitch(
                    activeColor: Colors.deepPurple,
                    value: themeProvider.isDarkTheme,
                    onChanged: (value) {
                      themeProvider.toggleTheme();

                    },
                  ),
                ],
              ),
            ),

            Divider(

              color: Colors.grey,
              thickness: 1,

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                children: [
                   CustomText(text: AppLocalizations.of(context)!
                      .translate("Arabic Language key"),size: 20,),
                  const Spacer(),


                  CupertinoSwitch(
                    dragStartBehavior: DragStartBehavior.start,
                    activeColor: Colors.deepPurple,
                    value: _switchValue2,
                    onChanged: ( value) {
                      setState(() {
                        _switchValue2 = value;

                        if (_switchValue2) {
                          AppLocalizations.of(context)!.loadJsonLanguage('ar');
                        } else {
                          AppLocalizations.of(context)!.loadJsonLanguage('en');
                        }
                      });
                    },
                  )





                ],
              ),
            ),

            Divider(
              color: Colors.grey,
              thickness: 1,

            ),
          ],
        ),
      ));
    }
  }
