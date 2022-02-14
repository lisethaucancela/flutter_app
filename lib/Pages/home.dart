import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/pag_quilamo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/Pages/paquete.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return ListView(
        //padding: EdgeInsets.only(top:0),
        //physics: BouncingScrollPhysics(),
        //child: Row(
        children: <Widget>[
          Container(
            //height: 151,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            child: const Text(
              'WEKA',
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff142855),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          getCardLugares(context),
          getCardPaquetes(context),
        ]
        //)
        );
  }

  Widget getCardLugares(context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PagQuilamo()));
      },

      child: Container(
          margin:
              const EdgeInsets.only(left: 30, top: 00, right: 30, bottom: 20),
          padding:
              const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
          height: size.height * 0.3,
          //width: 340,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child:
              getCard(size,'images/paisaje.jpg', 'MORONA SANTIAGO', 'Conoce mas')),
      //)
    );
  }

  Widget getCardPaquetes(context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FutureBuilderTest()));
      },

      child: Container(
          margin:
              const EdgeInsets.only(left: 30, top: 00, right: 30, bottom: 20),
          padding:
              const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
          height: size.height * 0.30,
          //width: 340,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: getCard(size,
              'images/img_05.png', 'Paquetes', 'Subtropical . 18 - 22.8°C')),
      //)
    );
  }

  Widget getCard( size,image, title, text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(
          width: (size.width - 80) / 2,
          height: (size.width - 80) / 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 20.0, 0, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: Color(0xff142855),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 6.0),
              Text(text, style: TextStyle(fontSize: 16, color: Colors.black45)),
            ],
          ),
        ),
      ],
    );
  }
}
