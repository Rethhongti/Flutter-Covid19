import 'package:covid19/EmergencyScreen.dart';
import 'package:covid19/HomeScreen.dart';
import 'package:covid19/TipScreen.dart';
import 'package:covid19/WorldScreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedIndex = 0;

  PageController _pageController = PageController();
  HomeScreen home = HomeScreen();
  WorldScreen world = WorldScreen();
  TipScreen tip = TipScreen();
  EmergencyScreen emergen = EmergencyScreen();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _buildBody,
        bottomNavigationBar: _buildNavBar,
      ),
    );
  }

  get _buildBody{
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      children: [
        home,
        world,
        tip,
        emergen,
      ],
    );
  }
  get _buildNavBar {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: "World"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: "Tips"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: "Emergency"
        ),
      ],
    );
  }
}
