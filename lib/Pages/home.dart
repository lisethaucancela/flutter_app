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
          const Quilamo(),
          Prueba(),
        ]
        //)
        );
  }
}

class Quilamo extends StatelessWidget {
  const Quilamo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PagQuilamo()));
      },
      //child: Positioned(
      // bottom: 0,
      // top: 0,

      child: Container(
        margin: const EdgeInsets.only(left: 30, top: 00, right: 30, bottom: 12),
        padding: const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 20),
        //height:260,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 22.0 / 10.0,
              child: Image.asset('images/paisaje.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text('MORONA SANTIAGO',
                      style: TextStyle(
                          color: Color(0xff142855),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 6.0),
                  Text('Conoce mas',
                      style: TextStyle(fontSize: 16, color: Colors.black45)),
                ],
              ),
            ),
          ],
        ),
      ),
      //)
    );
  }

  GestureDetector _buildCard(BuildContext context, String titulo,
      String subtitulo, String image, String link) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PagQuilamo()));
      },
      //child: Positioned(
      // bottom: 0,
      // top: 0,

      child: Container(
        margin: const EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 20),
        padding: const EdgeInsets.only(left: 0, top: 30, right: 0, bottom: 20),
        height: 240,
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(image),
              width: 240,
              height: 160,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 8),
            Text(titulo,
                style: const TextStyle(color: Colors.black87, fontSize: 22)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subtitulo,
                    style:
                        const TextStyle(fontSize: 15, color: Colors.black45)),
              ],
            )
          ],
        ),
      ),
      //)
    );
  }
}

class Prueba extends StatelessWidget {
  Prueba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FutureBuilderTest()));
        },
        child: Positioned(
          bottom: 0,
          child: Container(
            margin:
                const EdgeInsets.only(left: 30, top: 00, right: 30, bottom: 12),
            padding:
                const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const Image(image: AssetImage('images/img_05.png' ) ,width: 240, height: 160,fit: BoxFit.fill),
                AspectRatio(
                  aspectRatio: 22.0 / 10.0,
                  child: Image.asset('images/img_05.png'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text('Paquetes',
                          style: TextStyle(
                              color: Color(0xff142855),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.0),
                      Text('Subtropical . 18 - 22.8°C',
                          style:
                              TextStyle(fontSize: 16, color: Colors.black45)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
