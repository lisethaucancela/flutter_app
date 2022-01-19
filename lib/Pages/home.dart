import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/pag_quilamo.dart';
import 'package:flutter_app/Pages/paquetes.dart';
import 'package:flutter_app/Pages/mapa.dart';
import 'package:flutter_app/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/Pages/paquete.dart';

class HomePage extends StatelessWidget {

  HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';
  @override

  Widget build(BuildContext context) {
    return   ListView(
        padding: EdgeInsets.only(top:0),
        physics: BouncingScrollPhysics(),
        children: [
          Center(
              child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: const Text('MORONA SANTIAGO',
              style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold ),
              textAlign: TextAlign.center,  ),


          )),

          const Quilamo(),
          Prueba(),
    ]

      );

  }

}


class Quilamo extends StatelessWidget{
  const Quilamo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PagQuilamo())
          );
        },
        //child: Positioned(
         // bottom: 0,
         // top: 0,

          child: Container(
            margin: const EdgeInsets.only(left: 20,top: 0,right: 20, bottom: 20),
            padding: const EdgeInsets.all(22),
            height:260,
            width: 340,
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage('images/paisaje.jpg'), width: 240, height: 160,fit: BoxFit.fill, ),

                const SizedBox(height: 8),
                const Text('Mirador del Quilamo', style: TextStyle( color: Colors.black87,fontSize: 22 )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Subtropical . 18 - 22.8°C', style: TextStyle(fontSize: 15, color: Colors.black45)),
                  ],
                )
              ],
            ),
          ),
        //)
    );
  }
  GestureDetector _buildCard (BuildContext context, String titulo, String subtitulo, String image, String link) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PagQuilamo())
        );
      },
      //child: Positioned(
      // bottom: 0,
      // top: 0,

      child: Container(
        margin: const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
        padding: const EdgeInsets.all(22),
        height: 260,
        width: 340,
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(image),
              width: 240,
              height: 160,
              fit: BoxFit.fill,),

            const SizedBox(height: 8),
            Text(
                titulo,
                style: const TextStyle(color: Colors.black87, fontSize: 22)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subtitulo,
                    style: const TextStyle(fontSize: 15, color: Colors.black45)),
              ],
            )
          ],
        ),
      ),
      //)
    );
  }
}

class Prueba extends StatelessWidget{
   Prueba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onTap:(){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  FutureBuilderTest())
          );
        },
        child: Positioned(
          bottom: 0,
          top: 100,

          child: Container(
            margin: const EdgeInsets.only(left: 20,top: 0,right: 20, bottom: 20),
            padding: const EdgeInsets.all(22),
            height:260,
            width: 340,
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Image(image: AssetImage('images/img_05.png' ) ,width: 240, height: 160,fit: BoxFit.fill),
                const SizedBox(height: 8),
                const Text('Paquetes', style: TextStyle( color: Colors.black87,fontSize: 18 )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Subtropical . 18 - 22.8°C', style: TextStyle(fontSize: 15, color: Colors.black45)),
                  ],
                ),

              ],
            ),
          ),
        )
    );
  }

}




