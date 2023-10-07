import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../constants/app_localization.dart';
import '../constants/custom_text.dart';
import '../cubit/local_cubit.dart';
import '../cubit/local_state.dart';
import '../cubit/theme_provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}


class _MoreScreenState extends State<MoreScreen> {

  dynamic currentLanguage = 'en';
  late  var _switchValue2 = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(child: Scaffold(

      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!
              .translate("More key"),
          fontWeight: FontWeight.bold,
          color: Colors.black,
          size: 25,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,

      ),


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: CustomText(text: AppLocalizations.of(context)!
                .translate("settings key"),
                fontWeight: FontWeight.bold,
                size: 20),
          ),
          const Divider(

            color: Colors.grey,
            thickness: 1,

          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                CustomText(text: AppLocalizations.of(context)!
                    .translate("Dark Mode key"), size: 20,),
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

          const Divider(

            color: Colors.grey,
            thickness: 1,

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                CustomText(text: AppLocalizations.of(context)!
                    .translate("Arabic Language key"), size: 20,),
                const Spacer(),


                BlocBuilder<LocaleCubit, ChangeLocaleState>(
                  builder: (context, state) {
                    return CupertinoSwitch(
                      activeColor: Colors.deepPurple,
                      value: _switchValue2,
                      onChanged: (_switchValue2) {
                        setState(() {
                          this._switchValue2 = _switchValue2;
                          context.read<LocaleCubit>().changeLanguage(
                            _switchValue2 ? "ar" : "en",
                          );
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          const Divider(
            color: Colors.grey,
            thickness: 1,

          ),
        ],
      ),
    ));
  }
}
