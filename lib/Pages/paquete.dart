import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/Pages/descripcion_paquete.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/Pages/mapa.dart';

class FutureBuilderTest extends StatefulWidget {
  @override
  ListaPaquetes createState() => ListaPaquetes();
}

class ListaPaquetes extends State<FutureBuilderTest> {
  //FirebaseDatabase({FirebaseApp app, String databaseURL})
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final databaseReference = FirebaseDatabase.instance.ref('Paquete');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('PAQUETES TURÍSTICOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              )),
          backgroundColor: const Color(0xff142855)),
      body: FutureBuilder(
          future: FirebaseDatabase.instance.ref('Paquete').once(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot);
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                print(snapshot.data.snapshot.value.length);

                Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                List<dynamic> list = map.values.toList();
                //List<dynamic> list = snapshot.data.snapshot.value;
                var size = MediaQuery.of(context).size;
                double wid = size.width * 0.04;
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //maxCrossAxisExtent: 332,
                        childAspectRatio: (size.width) / (size.height * 0.7),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2),
                    padding: EdgeInsets.only(
                        top: 20, left: wid, right: wid, bottom: 20),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => descripcion_paquete(
                                        Lista: list[index])));
                          },
                          child: Container(
                              //clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                  image: DecorationImage(
                                      image: NetworkImage(list[index]['url']),
                                      fit: BoxFit.cover)),
                              //height: size.height *0.5,
                              padding: EdgeInsets.only(
                                  top: 0, left: 0, right: 0, bottom: 0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //padding: const EdgeInsets.all(4.0),
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 0,
                                          left: size.width * 0.0,
                                          right: size.width * 0.0,
                                          bottom: 0),
                                      width: (size.width) * 0.50,
                                      height: (size.height) * 0.29,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  list[index]['url']),
                                              fit: BoxFit.cover)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 10, 8, 0),
                                      child: Column(
                                        children: [
                                          //Image.network(list[index]['url']),
                                          //Text(
                                          // '${list[index]['Nombre']}',
                                          //  style: const TextStyle(
                                          //     fontSize: 16,
                                          //      fontWeight: FontWeight.bold),
                                          //),

                                          //Text(list[index]['Nombre'],
                                          // style: TextStyle(fontSize: 14)),
                                        ],
                                      ),
                                    ),
                                  ])));
                    });
              } else {
                return Center(
                    child: Container(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Existe un problema de conexión, intente mas tarde. ')
                  ],
                )));
              }
            } else {
              return Center(
                  child: Container(
                      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  CircularProgressIndicator(),
                ],
              )));
            }
          }),
      //],
      // ),
    );
  }

  void getData() async {
    Stream<DatabaseEvent> stream = databaseReference.onValue;
    print(stream);
// Subscribe to the stream!
    stream.listen((DatabaseEvent event) {
      print('Snapshot: ${event.snapshot.value}');
    });

    DatabaseEvent event = await databaseReference.once();

    //Print the data of the snapshot
    //print('event: ${event.snapshot.value}');
  }

  List<Widget> _getDatas(AsyncSnapshot snapshot) {
    List<Widget> dataList = [];
    final mapList = Map<dynamic, dynamic>.from(snapshot.data.snapshot.value);
    mapList.forEach((key, value) {
      final nextHotel = Map<dynamic, dynamic>.from(value);
      print(nextHotel['Nombre']);
      dataList.add(Text(nextHotel["Nombre"]));
    });

    return dataList;
  }


}

class Paquete {
  final String Nombre;
  final String Descripcion;
  final String Titulo;

  Paquete(this.Nombre, this.Descripcion, this.Titulo);
}

class dataPackage extends StatelessWidget {
  dataPackage(Object objdatabase);

  get objdatabase => null;

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> fridgesDs = objdatabase as Map;
    fridgesDs.forEach((key, value) {
      print('V $value');
      print(value["Nombre"]);
      //paquetes(value["Nombre"]);
      Text(value["Nombre"]);
    });
    return Text("Nombre");
  }
}
