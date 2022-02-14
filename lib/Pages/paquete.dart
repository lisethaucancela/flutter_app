import 'dart:ffi';

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
    return MaterialApp(
      home: Scaffold(
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

                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 800,
                            childAspectRatio: 7 / 6,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    padding: const EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 5),
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
                          child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //padding: const EdgeInsets.all(4.0),
                                  children: <Widget>[
                                    AspectRatio(
                                      aspectRatio: 18.0 / 11.0,
                                      child: Image.network(list[index]['url']),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16.0, 0, 16.0, 0),
                                      child: Column(
                                        children: [
                                          //Image.network(list[index]['url']),
                                          Text(
                                            '${list[index]['Titulo']}',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(list[index]['Nombre'],
                                              style: TextStyle(fontSize: 14)),
                                        ],
                                      ),
                                    ),
                                  ])));
                    });
              } else {
                return Text(
                    'Existe un problema de conexión, intente mas tarde. ');
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        //],
        // ),
      ),
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
