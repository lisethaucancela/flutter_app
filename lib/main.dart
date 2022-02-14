import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/drawer_menu.dart';
import 'package:flutter_app/Pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Example());
}

class Example extends StatefulWidget {
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<Example> {
  // MyApp({Key? key}) : super(key: key);
  static String home = HomePage.routeName;
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Profile',
    ),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        routes: {
          home: (context) => HomePage(),
        },
        home: Scaffold(
            appBar: AppBar(
                title: const Text('TURISMO APP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )),
                backgroundColor: const Color(0xff142855)),
            drawer: const DrawerMenu(),
            backgroundColor: const Color(0xffF0F3F8),
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),

            bottomNavigationBar: getavigationBar()
          //)
        ));
  }

  Widget getavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: GNav(
        rippleColor: Colors.purple,
        // tab button ripple color when pressed
        hoverColor: Colors.grey,
        // tab button hover color
        haptic: true,
        // haptic feedback
        tabBorderRadius: 15,
        //tabActiveBorder: Border.all(color: Colors.purple, width: 0), // tab button border
        //tabBorder: Border.all(color: Colors.grey, width: 0), // tab button border
        // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
        curve: Curves.easeOutExpo,
        // tab animation curves
        duration: Duration(milliseconds: 900),
        // tab animation duration
        gap: 8,
        // the tab button gap between icon and text
        color: Colors.grey[900],
        // unselected icon color
        activeColor: Colors.purple,
        // selected icon and text color
        iconSize: 28,
        // tab button icon size
        tabBackgroundColor: Colors.purple.withOpacity(0.2),
        // selected tab background color
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        textStyle: TextStyle(
          color: Colors.purple,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        mainAxisAlignment: MainAxisAlignment.center,
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Inicio',
          ),
          GButton(
            icon: Icons.call,
            text: 'Contacto',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
