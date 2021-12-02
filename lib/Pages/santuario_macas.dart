import 'package:flutter/material.dart';


class SantuarioMacas extends StatelessWidget {
  const SantuarioMacas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold (
        appBar: AppBar(
          title: const Text('Santuario Nacional Purísima de Macas',
          style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          )),
          backgroundColor: const Color(0xff373851)
        ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Image(image: AssetImage('images/img_05.png'),height: 200, fit: BoxFit.fill, ),

        ],
      )
    ),
    );
  }
}