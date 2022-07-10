import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';


class contacto extends StatelessWidget {
  contacto({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(children: <Widget>[
      Container(
        width: size.width * 1,
        height: size.height * 0.15,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Wekain_logo.png'), fit: BoxFit.contain),
        ),
      ),
      Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getCard(Icon(Icons.facebook_outlined),
                  'https://es-la.facebook.com/wekain/','weka'),
              getCard(Icon(Icons.camera_alt_outlined),
                  'https://instagram.com/wekain?utm_medium=copy_link','weka'),
              getCard(Icon(Icons.computer),
                  'https://www.wekainecuador.com','wekainecuador.com'),
            ]),
      ),
    ]);
  }
}

Widget getCard(Icon icon, fallbackUrl,text) {
  return
    GestureDetector(

        onTap: () {
          try {
            bool launched = launch(fallbackUrl,
                forceSafariVC: false, forceWebView: false) as bool;
            if (!launched) {
              launch(fallbackUrl,
                  forceSafariVC: false, forceWebView: false);
            }
          } catch (e) {
            launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
          }
        },
  child:
    Stack(

        children: <Widget>[
    Container(
        margin: const EdgeInsets.all(10),
        width:500,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Icon(
              icon.icon,
              size: 40,
              color: Colors.black,
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13, color: Color(0xff000000))),

            ]
        ))
  ])
    );
}

void _launchSocial(String url, String fallbackUrl) async {
  // Don't use canLaunch because of fbProtocolUrl (fb://)
  try {
    bool launched =
        await launch(url, forceSafariVC: false, forceWebView: false);
    if (!launched) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  } catch (e) {
    await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  }
}
