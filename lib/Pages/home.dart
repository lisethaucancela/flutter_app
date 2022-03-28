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
            width: MediaQuery.of(context).size.width * 1 ,
            height: MediaQuery.of(context).size.height * 0.15,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/Wekain_logo.png'), fit: BoxFit.contain),
            ),
            child: Container(

            ),
          ),
          getCardPaquetes(context),
          getCardLugares(context),
        ]
        //)
        );
  }

  Widget getCardLugares(context) {
    var size = MediaQuery.of(context).size;
    double wid = size.width*0.18;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  PagQuilamo()));
      },

      child: Container(
          margin:
               EdgeInsets.only(left: wid, top: 00, right: wid, bottom: 20),
          padding:
              const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
          height: size.height * 0.33,

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
              getCard(size,'images/paisaje.jpg', 'GALERIA DE FOTOS', 'Conoce mas')),
      //)
    );
  }

  Widget getCardPaquetes(context) {
    var size = MediaQuery.of(context).size;
    double wid = size.width*0.18;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FutureBuilderTest()));
      },

      child: Container(
          margin:
               EdgeInsets.only(left: wid, top: 00, right: wid, bottom: 20),
          padding:
              const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
          height: size.height * 0.33,
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
              'images/Packing.jpg', 'PAQUETES TURISTICOS', 'Subtropical . 18 - 22.8°C')),
      //)
    );
  }

  Widget getCard( size,image, title, text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(
          //width: (size.width ) *0.6,
          height: size.height * 0.28,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: Color(0xff142855),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              //SizedBox(height: 6.0),
              //Text(text, style: TextStyle(fontSize: 16, color: Colors.black45)),
            ],
          ),
        ),
      ],
    );
  }
}
