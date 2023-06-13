import 'package:booking_hotel/Helper.dart';
import 'package:booking_hotel/Screens/ListBillScreen.dart';
import 'package:booking_hotel/Screens/SettingScreen.dart';
import 'package:booking_hotel/Screens/UserInfoScreen.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;

  const BottomNavigation({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState(currentIndex);
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int _currentIndex;

  _BottomNavigationState(int currentIndex) {
    _currentIndex = currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });

        // Navigate to a new screen based on the tapped index
        switch (index) {
          case 0:
            Helper.newPage(context, const HomeScreen());
            break;
          case 1:
            Helper.newPage(context, const ListBillScreen());
            break;
          case 2:
            Helper.newPage(context, const UserInfoScreen());
            break;
          case 3:
            Helper.newPage(context, const SettingScreen());
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.blueGrey,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_grocery_store),
          label: 'Bills',
          backgroundColor: Colors.deepOrange,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'User',
          backgroundColor: Colors.deepPurple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Setting',
          backgroundColor: Colors.pink,
        ),
      ],
    );
  }
}
