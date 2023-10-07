import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/more_screen.dart';
import 'app_localization.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {


  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  final screens = [
    Center(child: HomeScreen(),),
    Center(child: MoreScreen(),)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
          type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage('assets/Home_no selection.png'),),
            label: AppLocalizations.of(context)!
              .translate("Home key"),
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage('assets/More_not selected.png')),
            label: AppLocalizations.of(context)!
        .translate("More key"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),

      body: screens[_selectedIndex],

    ));
  }
}
