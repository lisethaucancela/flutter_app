import 'package:flutter/material.dart';
import 'main.dart';

class DrawerMenu extends StatelessWidget{
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
          children: <Widget>[
            _buildDrawerHeader(),

            _buildDrawerItem(icon: Icons.home, text: 'Inicio', onTap: () => {
              Navigator.pushReplacementNamed(context, MyApp.home)
            }),
            ListTile(
              title: const Text("MENU 2"),
              onTap: (){},
            ),
            const ListTile(
              title: Text("MENU 3"),
            ),
            const ListTile(
              title: Text("MENU 4"),
            )

          ]

      ),
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
       margin: EdgeInsets.zero,
       padding: EdgeInsets.zero,
       decoration: const BoxDecoration(
           image: DecorationImage(
               fit: BoxFit.fill,
               image: AssetImage('images/paisaje.jpg'))),
      child: Stack(children: const <Widget>[
        Positioned(
            bottom: 20.0,
            left: 20.0,
            child: Text("PUYO",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500)))
      ])
    );
   }

  Widget _buildDrawerItem(
      {required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
