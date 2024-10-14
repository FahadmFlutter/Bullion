import 'package:bullion/pages/Contact/contact_screen.dart';
import 'package:bullion/pages/Live%20chart/live_chart_screen.dart';
import 'package:bullion/pages/Rate%20alert/rate_alert_screen.dart';
import 'package:bullion/pages/Settings/settings_screen.dart';
import 'package:bullion/pages/Spot/spot_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final screens = [
    const RateAlertScreen(),
    const ContactScreen(),
    const SpotScreen(),
    const LiveChartScreen(),
    const SettingsScreen(),
  ];
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: const Color(0xFF131313),
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color:Color(0xFFD4AF37) ),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        iconSize: 30,
        selectedLabelStyle: const TextStyle(
          color: Color(0xFFD4AF37),
          fontSize: 8,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xB2FBF4E4),
          fontSize: 8,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
        selectedItemColor: const Color(0xFFD4AF37),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.notifications),
              ), label: "Rate Alert"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.support_agent),
              ), label: "Contact"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.home_rounded),
              ), label: "Spot"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.insert_chart_outlined),
              ), label: "Live Chart"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.menu),
              ), label: "More"),
        ],
      ),
    );
  }
}
